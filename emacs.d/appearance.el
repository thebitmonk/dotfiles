; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

; No toolbar
(tool-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
; load proper theme
(load-theme 'base16-railscasts-dark t)

; Enabling visual line mode
(global-visual-line-mode t)


; Get rid of the butt ugly OSX scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)


(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; global hi line mode
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)

; Use solarized dark (in GUI)
;(when (display-graphic-p) (load-theme 'solarized-dark t))



; Use Source Code Pro 14pt in GUI
;(when (display-graphic-p) (set-face-attribute 'default nil :font "Source Code Pro for Powerline-14"))

(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
(setq zoom-window-mode-line-color "DarkGreen")
