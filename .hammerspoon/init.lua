local hyper = {"ctrl", "alt", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0
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

-- Windows style ALT-TAB
-- switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{})
-- hs.hotkey.bind('alt', 'tab', function() switcher:next() end)
-- hs.hotkey.bind('alt-shift', 'tab', function() switcher:previous() end)
-- hs.hotkey.bind('alt', 'tab', hs.window.switcher.nextWindow)
-- hs.hotkey.bind('alt-shift', 'tab', hs.window.switcher.previousWindow, nil, hs.window.switcher.previousWindow)
-- hs.window.switcher.ui.showSelectedTitle = false
-- hs.window.switcher.ui.showSelectedThumbnail = false
-- hs.window.switcher.ui.thumbnailSize = 128
-- hs.window.animationDuration = 0
