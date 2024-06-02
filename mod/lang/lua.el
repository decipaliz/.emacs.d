;; -*- lexical-binding: t -*-

(package! lua-mode
          (hooks! lua-mode-hook #'hs-minor-mode)
          (setq lua-indent-level 4))

(when! lsp
       (hooks! lua-mode-hook #'lsp))
