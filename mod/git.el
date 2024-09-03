;; -*- lexical-binding: t -*-

(package! transient)
(package! magit)
(package! magit-section)
(package! gitignore-templates)
(package! git-gutter
          (global-git-gutter-mode +1))

(def!
 "g" (cons "git" (make-sparse-keymap))
 "gg" 'magit
 "gi" 'gitignore-templates-new-file
 "gI" 'gitignore-templates-insert)
