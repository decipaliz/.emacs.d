;; -*- lexical-binding: t -*-

(package! zig-mode)

(hooks! zig-mode-hook #'hs-minor-mode)
(when! lsp
       (hooks! zig-mode-hook #'lsp))
