;; -*- lexical-binding: t -*-

(load-file (expand-file-name "core/macros.el" user-emacs-directory))

(load! core/elpaca)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t t)

(load! config)
(load! package/init)
(load! local/init)
