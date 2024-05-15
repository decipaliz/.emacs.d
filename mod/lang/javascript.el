;; -*- lexical-binding: t -*-

(package! jsdoc)
(package! typescript-mode)

(defun rc/js-keymap ()
  (tyrant-def
    "c" (cons "javascript" (make-sparse-keymap))
    "cd" 'jsdoc))

(rlhooks! (typescript-mode-hook js-mode-hook)
          (#'lsp #'hs-minor-mode (lambda ()
                                   (tyrant-def
                                     "c" (cons "javascript" (make-sparse-keymap))
                                     "cd" 'jsdoc))))
