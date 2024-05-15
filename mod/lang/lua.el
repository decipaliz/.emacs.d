;; -*- lexical-binding: t -*-

(package! lua-mode
          (hooks! lua-mode-hook #'hs-minor-mode))

(when! lsp
       (hooks! lua-mode-hook #'lsp))
