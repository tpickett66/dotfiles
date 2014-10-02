;;;; Load and enable evil-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/evil"))
(require 'evil)
(evil-mode 1)

;;;; Require and load our preferred color scheme
(add-to-list 'custom-theme-load-path 
  (expand-file-name "~/solarized/emacs-colors-solarized")
(load-theme 'solarized-dark t)
