## Copyrght (c) 2023, Miro Mannino
## All rights reserved.

import json
import sys

MAIN_TEMPLATE_PATH = 'karabiner.template.json'
KARABINER_JSON_PATH = 'karabiner.json'
HYPER_KEY = None 
MEH_KEY = None 

def load_json_file(path):
  with open(path, 'r') as file:
    return json.load(file)

def save_json_file(path, obj):
  with open(path, 'w') as file:
    json.dump(obj, file, indent=2)

def open_rule(path):
  return {
    'to': [
      {
        'shell_command': f'open {path}',
      }
    ],
    'description': f'Open {path}'
  }

def app_rule(app_name):
  return open_rule("-a '" + app_name + ".app'")

def process_hyper_sub_layer(sublayer_key, obj):
  global HYPER_KEY

  res = [ 
    {
      'description': f'Toggle Hyper sublayer {sublayer_key}',
      'type': 'basic',
      'from': {
        'key_code': sublayer_key,
        'modifiers': {
          'mandatory': HYPER_KEY 
        }
      },
      'to_after_key_up': [
        {
          'set_variable': {
            'name': f'hyper_sublayer_{sublayer_key}',
            'value': 0
          }
        }
      ],
      'to': [
        {
          'set_variable': {
            'name': f'hyper_sublayer_{sublayer_key}',
            'value': 1
          }
        }
      ],
      'conditions': [
        { 'type': 'variable_if', 'name': f'hyper_sublayer_{secondary_key}', 'value': 0 } 
        for secondary_key in obj.keys() if secondary_key != sublayer_key
      ]
    }
  ]
  for secondary_key in obj.keys():
    if secondary_key == 'description':
      continue
    res.append({
      **process_json_object(obj[secondary_key]),
      'type': 'basic',
      'from': {
        'key_code': secondary_key,
        'modifiers': {
          'mandatory': ['any'],
        },
      },
      'conditions': [
        {        
          # Only trigger if the sublayer key is pressed 
          'type': 'variable_if',
          'name': f'hyper_sublayer_{sublayer_key}',
          'value': 1,
        },
      ],
    })

  return res  

def process_hyper_sub_layers(obj):
  res = []
  for sublayer_key in obj.keys():
    if sublayer_key == 'description':
      continue
    sub_layer_obj = {
      'description': f'Sublayer {sublayer_key}',
      'manipulators': process_hyper_sub_layer(sublayer_key, obj[sublayer_key]),
    }
    res.append(sub_layer_obj)
  return res

def process_set_hyper_key(obj):
  global HYPER_KEY
  modifiers = obj['modifiers']
  HYPER_KEY = obj['modifiers']
  if 'key' not in obj:
    return None
  hyper_key = obj['key']
  return {
    'description': f'Change {hyper_key} to hyper key',
    'manipulators': [
      {
        'type': 'basic',
        'from': {
          'key_code': hyper_key,
          'modifiers': {
            'optional': ['any']
          }
        },
        'to': [
          {
            'key_code': modifiers[0],
            'modifiers': modifiers[1:] 
          }
        ]
      }
    ]
  }

def process_set_meh_key(obj):
  global MEH_KEY
  modifiers = obj['modifiers']
  MEH_KEY = obj['modifiers']
  if 'key' not in obj:
    return None

  meh_key = obj['key']
  return {
    'description': f'Change {meh_key} to meh key',
    'manipulators': [
      {
        'type': 'basic',
        'from': {
          'key_code': meh_key,
          'modifiers': {
            'optional': ['any']
          }
        },
        'to': [
          {
            'key_code': modifiers[0],
            'modifiers': modifiers[1:] 
          }
        ]
      }
    ]
  }

def process_key(key_code):
  if key_code.startswith('$meh_'):
    return {
      'to': [ { 
        'key_code': key_code.replace('$meh_', ''),
        'modifiers': MEH_KEY
      } ],
      'type': 'basic'
    }
  if key_code.startswith('$hyper_'):
    return {
      'to': [ { 
        'key_code': key_code.replace('$hyper_', ''),
        'modifiers': HYPER_KEY
      } ],
      'type': 'basic'
    }
  return {
    'to': [ { 'key_code': key_code } ],
    'type': 'basic'
  }


def process_url(url):
  return {
    'to': [
      { 'shell_command': f'osascript -e \'open location "{url}"\'' }
    ],
    'description': f'Open {url}'
  }

def process_json_object(obj):
  if isinstance(obj, dict):
    if '$app' in obj:
      return app_rule(obj['$app'])
    if '$open' in obj:
      return open_rule(obj['$open'])
    if '$key' in obj:
      return process_key(obj['$key'])
    if '$url' in obj:
      return process_url(obj['$url'])
    if 'rules' in obj:
      res = []
      for rule in obj['rules']:
        # We process first the set hyper key rule
        if '$set-hyper-key' in rule:
          hyper_key_rule = process_set_hyper_key(rule['$set-hyper-key'])
          if hyper_key_rule:
            res.append(hyper_key_rule)
        if '$set-meh-key' in rule:
          meh_key_rule = process_set_meh_key(rule['$set-meh-key'])
          if meh_key_rule:
            res.append(meh_key_rule)
      for rule in obj['rules']:
        if '$import' in rule:
          res.append(load_json_file(f'./imports/{rule["$import"]}.json'))
        if '$hyper-sub-layers' in rule:
          res += process_hyper_sub_layers(rule['$hyper-sub-layers'])
      return {'rules': res}
    else:
      return {k: process_json_object(v) for k, v in obj.items()}
  elif isinstance(obj, list):
    return [process_json_object(elem) for elem in obj ]
  else:
    return obj

if __name__ == '__main__':
  args = sys.argv[1:]
  if len(args) != 2:
    print('Usage: process-template.py <input-file> <output-file>')
    exit(1)

  template = load_json_file(args[0])
  processed_template = process_json_object(template)
  save_json_file(args[1], processed_template)

