(require 'fiplr)

(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "C-x d") 'fiplr-find-directory)
