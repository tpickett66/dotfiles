;;;; Load and enable evil-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/evil"))
(require 'evil)
(evil-mode 1)

;;;; Require and load our preferred color scheme
(add-to-list 'custom-theme-load-path 
  (expand-file-name "~/.emacs.d/themes/emacs-color-theme-solarized"))

(load-theme 'solarized-dark t)
(setq solarized-use-terminal-theme t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#262626" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#626262"])
 '(background-color "#1c1c1c")
 '(background-mode dark)
 '(cursor-color "#808080")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#808080"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
