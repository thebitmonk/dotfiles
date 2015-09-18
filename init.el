(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

;; to disable the obnoxious startup screen
(setq inhibit-startup-message t)

;; screen maximizing is not working as of now
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)

;; mapping ctrl + u to page up like in vim. Restoring sanity of universe
(setq evil-want-C-u-scroll t)

;; vim map leader key
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)


(require 'evil)
(evil-mode 1)
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


(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
(add-hook 'neotree-mode-hook
                      (lambda ()
                        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                        (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
                        (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
                        (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-vertical-split)
                        (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-horizontal-split)
                        (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
                        (define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)
                        (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
                        (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
                        (define-key evil-normal-state-local-map (kbd "c") 'neotree-copy-node)
                        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(projectile-global-mode)
(global-set-key (kbd "<C-x C-f>") 'projectile-find-file)

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun turn-on-flyspell () (flyspell-mode 1))
(defun turn-on-visual-line-mode() (visual-line-mode 1))
(add-hook 'markdown-mode-hook 'turn-on-flyspell)
(add-hook 'find-file-hook 'turn-on-visual-line-mode)

(setq markdown-command "pandoc --smart -f markdown -t html")

;; ansible yaml mode
(add-hook 'yaml-mode-hook #'ansible-doc-mode)

;; go lang
(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c j") 'godef-jump)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'godef-describe)))

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

;; global hi line mode
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)

;; ansible yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook #'ansible-doc-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "C-c j") 'jedi:goto-definition)))
(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "C-c i") 'jedi:show-doc)))

;; Fixing the emacs screen
;; This is bound to f11 in Emacs 24.4
(toggle-frame-fullscreen)
;; Who use the bar to scroll?
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Powerline mode
(require 'powerline)
(powerline-default-theme)

;; emacs backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; ORG MODE
;; auto-indent an org-mode file
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa

(eval-after-load "org"
    '(require 'ox-md nil t))

;; magit 
(global-set-key (kbd "C-x g") 'magit-status)

;; recent files
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

;; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
        (message "Aborting")))

;; yes or no p
(defalias 'yes-or-no-p 'y-or-n-p)
