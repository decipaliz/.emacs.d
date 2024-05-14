;;; projectile.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(package! projectile
          (projectile-mode +1))

(def!
 "p" (cons "projectile" 'projectile-command-map)
 "pa" 'projectile-add-known-project)

;;; projectile.el ends here
