;; global config
(show-paren-mode)
(column-number-mode)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '(("." . "~/.backups")))
(recentf-mode)
(ido-mode)

;; my own varibles and keys
(setq org-tags-column 52)
; show recent files when switching buffers [http://wikemacs.org/index.php/Ido#Virtual_Buffers]
(setq ido-use-virtual-buffers t)
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/org/"))

;; my own functions
(defun copy-line ()
  "Save current line into Kill-Ring without mark the line"
  (interactive)
  (let ((beg (line-beginning-position))
	(end (line-end-position)))
    (copy-region-as-kill beg end)))

(global-set-key (kbd "C-c C-k") 'copy-line)

;; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq el-get-sources
      '(
        (:name magit
         :after (global-set-key (kbd "C-x C-z") 'magit-status))

        (:name undo-tree
         :after (global-undo-tree-mode))

        (:name jedi
         :after (progn
                  (add-hook 'python-mode-hook 'jedi:setup)
                  (setq jedi:setup-keys t)
                  (setq jedi:complete-on-dot t)))

        (:name smex
         :after (progn
                  (global-set-key (kbd "M-x") 'smex)
                  (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

        ))

(setq my-packages (append '(el-get markdown-mode)
                          (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

