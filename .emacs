; global config
(show-paren-mode)
(column-number-mode)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '(("." . "~/.backups")))

; my own functions
(defun copy-line ()
  "Save current line into Kill-Ring without mark the line"
  (interactive)
  (let ((beg (line-beginning-position))
	(end (line-end-position)))
    (copy-region-as-kill beg end)))

(global-set-key (kbd "C-c C-k") 'copy-line)

; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq el-get-sources
      '(
        (:name undo-tree
         :after (global-undo-tree-mode))

        (:name jedi
         :after (progn
                  (add-hook 'python-mode-hook 'jedi:setup)
                  (setq jedi:setup-keys t)
                  (setq jedi:complete-on-dot t)))))

; load kinds of packages
(setq my-packages (append '(el-get markdown-mode)
                          (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
