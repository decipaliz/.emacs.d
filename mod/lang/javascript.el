;; -*- lexical-binding: t -*-

(package! jsdoc)
(package! typescript-mode)

(rhooks! #'hs-minor-mode
         typescript-mode-hook js-mode-hook)

(when! general
       (rhooks! (lambda ()
                 (tyrant-def
                   "c" (cons "javascript" (make-sparse-keymap))
                   "cd" 'jsdoc))
               typescript-mode-hook js-mode-hook))
