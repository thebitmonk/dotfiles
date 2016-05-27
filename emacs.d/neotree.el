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

