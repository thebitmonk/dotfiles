; Configure evil mode
; Use C-u for scrolling up
(setq evil-want-C-u-scroll t)

; Bind escape to quit minibuffers
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))

(global-set-key [escape] 'evil-exit-emacs-state)

; Use evil mode
(require 'evil)
(evil-mode t)

(setq evil-want-fine-undo 'fine)
;; esc quits
"Abort recursive edit. In Delete Selection mode, if the mark is active, just deactivate it;then it takes a second \\[keyboard-quit] to abort the minibuffer."
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
(global-evil-tabs-mode t)

(require 'highlight)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(global-set-key (kbd "<f3>") 'evil-search-highlight-persist-remove-all)
(setq evil-search-highlight-string-min-len 3)

