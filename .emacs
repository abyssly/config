;; global config
(show-paren-mode)
(column-number-mode)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '(("." . "~/.backups")))

;; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

;; load kinds of packages
(setq my-packages '(el-get switch-window xcscope))

(el-get 'sync my-packages)
