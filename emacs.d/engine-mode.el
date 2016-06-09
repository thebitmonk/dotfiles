(require 'engine-mode)
(engine-mode t)

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s&type=Code"
  :keybinding "h")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")


(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")


(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")
