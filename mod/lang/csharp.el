;; -*- lexical-binding: t -*-

(hooks! csharp-mode-hook #'hs-minor-mode)
(when! lsp
       (hooks! csharp-mode-hook #'lsp))
