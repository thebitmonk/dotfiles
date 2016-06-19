(require 'go-mode-autoloads)



(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/bitmonk/go")


(setq exec-path (cons "/usr/local/go/bin" exec-path))
(setenv "PATH" (concat (getenv "PATH") ":" "/home/bitmonk/go/bin"))
(setq exec-path (append exec-path (list (expand-file-name "/home/bitmonk/go/bin"))))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)


(defun my-go-mode-hook ()

  (require 'go-autocomplete)

  ;; disable gui messages
  ;; (setq flymake-gui-warnings-enabled nil)

  ;; don't start flymake on initial open.
  ;; (setq flymake-start-syntax-check-on-find-file nil)

  ;; (require 'flymake)
  ;; (add-to-list 'load-path "/home/bitmonk/go/src/github.com/dougm/goflymake")
  ;; (require 'go-flymake)
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c j") 'godef-jump)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'godef-describe)))

  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))


(add-hook 'go-mode-hook 'my-go-mode-hook)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)






