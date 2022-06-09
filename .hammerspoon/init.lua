local hyper = {"ctrl", "alt", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.1
spoon.MiroWindowsManager:bindHotkeys({
  up          = {hyper, "up"},
  down        = {hyper, "down"},
  left        = {hyper, "left"},
  right       = {hyper, "right"},
  fullscreen  = {hyper, "f"},
  center      = {hyper, "c"},
  resize      = {hyper, "r"},
  move        = {hyper, "v"},
  middle      = {hyper, "m"}
})