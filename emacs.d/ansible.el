
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

(add-hook 'yaml-mode-hook #'ansible-doc-mode)

(global-set-key (kbd "C-c C-j") 'ansible-doc)
