;; -*- lexical-binding: t -*-

(before!
 (add-hook 'prog-mode-hook #'hl-line-mode)
 (setq display-line-numbers-type 'relative)
 (global-display-line-numbers-mode))
