;; -*- lexical-binding: t -*-

(package! racket-mode)

(when! lispy
       (hooks! racket-mode-hook #'enable-paredit-mode #'rainbow-delimiters-mode))

(when! general
       (hooks! racket-mode-hook
               (lambda ()
                 (tyrant-def
                   "c" (cons "racket" (make-sparse-keymap))
                   "cr" (cons "run" (make-sparse-keymap))
                   "crr" 'racket-run-and-switch-to-repl
                   "crt" 'racket-test
                   "crR" 'racket-racket
                   "ch" (cons "help" (make-sparse-keymap))
                   "chh" 'racket-repl-describe
                   "chd" 'racket-documentation-search))))
