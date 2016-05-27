(require 'projectile)
(projectile-global-mode)
(setq projectile-require-project-root nil)
(global-set-key (kbd "<C-x C-f>") 'projectile-find-file)

