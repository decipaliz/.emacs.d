;; -*- lexical-binding: t -*-

(hooks! java-mode-hook #'hs-minor-mode)
(when! lsp
       (package! hydra)
       (package! lsp-java)
       (hooks! java-mode-hook #'lsp))
