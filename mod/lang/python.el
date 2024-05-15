;; -*- lexical-binding: t -*-

(hooks! python-mode-hook #'hs-minor-mode)

(when! lsp
       (hooks! python-mode-hook #'lsp))
