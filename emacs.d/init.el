(set-language-environment "UTF-8")

; Use the package manager
(require 'package)


(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives 
               '("gnu" . "http://elpa.gnu.org/packages/")))

; Initialize the package manager
(package-initialize)

(setq default-directory (concat (getenv "HOME") "/go/src/github.com/thebitmonk/sendx/platform"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Yes or no p
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


; Load appearance modules
(load-user-file "appearance.el")

; Load configuration modules
(load-user-file "evil.el")

; Load ansible modules
(load-user-file "ansible.el")

; Load magit modules
(load-user-file "magit.el")

; Load golang configuration file
(load-user-file "golang.el")

; Load engine mode configuration file
(load-user-file "engine-mode.el")

; Load neotree file
(load-user-file "neotree.el")

; Load org mode file
(load-user-file "org.el")

; Load projectile file
(load-user-file "projectile.el")

; Load recentf file
(load-user-file "recentf.el")

; Load webmode file
(load-user-file "webmode.el")

; Load fiplr file
(load-user-file "fiplr.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "d69a0f6d860eeff5ca5f229d0373690782a99aee2410a3eed8a31332a7101f1e" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "09669536b4a71f409e7e2fd56609cd7f0dff2850d4cbfb43916cc1843c463b80" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(org-agenda-files
   (quote
    ("~/go/src/github.com/thebitmonk/sendx/platform/notes.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(put 'narrow-to-region 'disabled nil)
