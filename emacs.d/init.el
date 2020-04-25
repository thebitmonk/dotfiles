(set-language-environment "UTF-8")

; Use the package manager
(require 'package)


(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)


(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives 
               '("gnu" . "http://elpa.gnu.org/packages/")))

; Initialize the package manager
(package-initialize)

(setq default-directory (concat (getenv "HOME") "/go/src/github.com/thebitmonk/sendx/smtp/api_server"))

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

; Load ox-reveal file
(load-user-file "ox-reveal.el")

(require 'org-roam)
(define-key org-roam-mode-map (kbd "C-c n l") #'org-roam)
(define-key org-roam-mode-map (kbd "C-c n f") #'org-roam-find-file)
(define-key org-roam-mode-map (kbd "C-c n b") #'org-roam-switch-to-buffer)
(define-key org-roam-mode-map (kbd "C-c n g") #'org-roam-graph)
(define-key org-mode-map (kbd "C-c n i") #'org-roam-insert)
(org-roam-mode +1)

(require 'org-roam-protocol)

(setq org-roam-directory "~/Desktop/zettelkasten/")
(setq org-roam-link-title-format "R:%s")
(setq org-roam-completion-system 'default)


(require 'company-org-roam)
(push 'company-org-roam company-backends)

(require 'deft)
(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/Desktop/zettelkasten/")
(setq deft-recursive t)
(global-set-key [f8] 'deft)
(setq deft-use-filename-as-title t)
(setq deft-file-naming-rules
      '((noslash . "-")
        (nospace . "-")
        (case-fn . downcase)))
(global-set-key (kbd "C-x C-g") 'deft-find-file)


(require 'org-download)

(setq-default org-download-image-dir "~/Desktop/zettelkasten/images")

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)


(setq org-agenda-files (list "~/Desktop/zettelkasten/"))

(require 'company-org-roam)
(push 'company-org-roam company-backends)

(defun org-roam--make-file (file-path &optional title)
  "Create an org-roam file at FILE-PATH, optionally setting the TITLE attribute."
  (if (file-exists-p file-path)
      (error (format "Aborting, file already exists at %s" file-path))
    (if org-roam-autopopulate-title
        (org-roam--populate-title file-path title)
      (make-empty-file file-path))
    (save-window-excursion
      (with-current-buffer (find-file file-path)
        (org-roam--update-cache)
        ))))

(setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
        ))

(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("NEXT" . (:foreground "IndianRed1" :weight bold))   
        ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold)) 
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))

(setq org-tag-persistent-alist 
      '((:startgroup . nil)
        ("HOME" . ?h) 
        ("RESEARCH" . ?r)
        ("TEACHING" . ?t)
        (:endgroup . nil)
        (:startgroup . nil)
        ("OS" . ?o) 
        ("DEV" . ?d)
        ("WWW" . ?w)
        (:endgroup . nil)
        (:startgroup . nil)
        ("EASY" . ?e)
        ("MEDIUM" . ?m)
        ("HARD" . ?a)
        (:endgroup . nil)
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)  
        )
      )

(setq org-tag-faces
      '(
        ("HOME" . (:foreground "GoldenRod" :weight bold))
        ("RESEARCH" . (:foreground "GoldenRod" :weight bold))
        ("TEACHING" . (:foreground "GoldenRod" :weight bold))
        ("OS" . (:foreground "IndianRed1" :weight bold))   
        ("DEV" . (:foreground "IndianRed1" :weight bold))   
        ("WWW" . (:foreground "IndianRed1" :weight bold))
        ("URGENT" . (:foreground "Red" :weight bold))  
        ("KEY" . (:foreground "Red" :weight bold))  
        ("EASY" . (:foreground "OrangeRed" :weight bold))  
        ("MEDIUM" . (:foreground "OrangeRed" :weight bold))  
        ("HARD" . (:foreground "OrangeRed" :weight bold))  
        ("BONUS" . (:foreground "GoldenRod" :weight bold))
        ("noexport" . (:foreground "LimeGreen" :weight bold))  
        )
)

(require 'ox-reveal)

(defun org-html-export-to-html
   (&optional async subtreep visible-only body-only ext-plist)
   (interactive)
   (let* ((extension (concat "." org-html-extension))
      (file (org-export-output-file-name extension subtreep "/Users/thebitmonk/Desktop/zettelkasten/export/docs"))
      (org-export-coding-system org-html-coding-system))
     (if async
     (org-export-async-start
         (lambda (f) (org-export-add-to-stack f 'html))
       (let ((org-export-coding-system org-html-coding-system))
         `(expand-file-name
           (org-export-to-file
            'html ,file ,subtreep ,visible-only ,body-only ',ext-plist))))
       (let ((org-export-coding-system org-html-coding-system))
     (org-export-to-file
      'html file subtreep visible-only body-only ext-plist)))))

(defun org-reveal-export-to-html
  (&optional async subtreep visible-only body-only ext-plist)
  "Export current buffer to a reveal.js HTML file."
  (interactive)
  (let* ((extension (concat "." org-html-extension))
         (file (org-export-output-file-name extension subtreep "/Users/thebitmonk/Desktop/zettelkasten/export/slides"))
         (clientfile (org-export-output-file-name (concat "_client" extension) subtreep)))
    ; export filename_client HTML file if multiplexing
    (setq client-multiplex nil)
    (let ((org-export-exclude-tags (cons "noexport_reveal" org-export-exclude-tags)))
      (setq retfile (org-export-to-file 'reveal file
		      async subtreep visible-only body-only ext-plist)))

    ; export the client HTML file if client-multiplex is set true
    ; by previous call to org-export-to-file
    (if (eq client-multiplex t)
        (org-export-to-file 'reveal clientfile
          async subtreep visible-only body-only ext-plist))
    retfile))
