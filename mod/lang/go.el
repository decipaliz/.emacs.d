;; -*- lexical-binding: t -*-

(package! go-mode)

(hooks! go-mode-hook #'lsp #'hs-minor-mode)

(setq-default tab-width 4)
