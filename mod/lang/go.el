;; -*- lexical-binding: t -*-

(package! go-mode)

(hooks! go-mode-hook #'hs-minor-mode)
(when! lsp
       (hooks! go-mode-hook #'lsp))

(setq-default tab-width 4)
