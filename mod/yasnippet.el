;; -*- lexical-binding: t -*-

(package! yasnippet
          (setq yas-nippet-dir "~/.emacs.d/snippets")
          (yas-global-mode +1))

(package! yasnippet-snippets)

(when! general
       (after!
        (tyrant-def
          "y" (cons "yasnippet" (make-sparse-keymap))
          "yn" 'yas-new-snippet
          "ys" 'yas-insert-snippet
          "yv" 'yas-visit-snippet-file)))
