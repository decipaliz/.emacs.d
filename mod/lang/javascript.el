;; -*- lexical-binding: t -*-

(package! jsdoc)
(package! typescript-mode)

(rlhooks! (typescript-mode-hook js-mode-hook)
          (#'lsp #'hs-minor-mode (lambda ()
                                   (tyrant-def
                                     "c" (cons "javascript" (make-sparse-keymap))
                                     "cd" 'jsdoc))))
