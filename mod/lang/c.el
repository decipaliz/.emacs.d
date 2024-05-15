;; -*- lexical-binding: t -*-

(package! cmake-mode)

(hooks! c-mode-hook #'lsp #'hs-minor-mode)
(hooks! c++-mode-hook #'lsp #'hs-minor-mode)

(setq c-basic-offset 4)
(setq c++-basic-offset 4)
