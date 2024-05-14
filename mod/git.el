;;; git.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(package! transient)
(package! magit)
(package! gitignore-templates)
(package! git-gutter
          (global-git-gutter-mode +1))

(def!
 "g" (cons "git" (make-sparse-keymap))
 "gg" 'magit
 "gi" 'gitignore-templates-new-file
 "gI" 'gitignore-templates-insert)

;;; git.el ends here
