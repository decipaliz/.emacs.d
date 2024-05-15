;; -*- lexical-binding: t -*-

(package! projectile
          (projectile-mode +1))

(when! general
       (def!
        "p" (cons "projectile" 'projectile-command-map)
        "pa" 'projectile-add-known-project))
