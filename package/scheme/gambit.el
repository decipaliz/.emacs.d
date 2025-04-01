;; -*- lexical-binding: t -*-

(add-to-list 'load-path "/usr/local/Gambit/share/emacs/site-lisp")
(require 'gambit)
(setq scheme-program-name "gsi -:d-")
(use-package geiser)
(use-package geiser-gambit)
(hooks! scheme-mode-hook #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "C-c" (cons "scheme" (make-sparse-keymap))

            "C-c C-r" (cons "geiser" (make-sparse-keymap))
            "C-c C-r C-r" 'geiser-mode-switch-to-repl
            "C-c C-r C-S-r" 'geiser
            "C-c C-r C-l" 'geiser-load-file
            "C-c C-r C-s" 'geiser-restart-repl
            "C-c C-r C-x" 'geiser-exit-repl

            "C-c C-r C-e" (cons "eval" (make-sparse-keymap))
            "C-c C-r C-e C-e" 'geiser-eval-definition
            "C-c C-r C-e C-r" 'geiser-eval-region
            "C-c C-r C-e C-s" 'geiser-eval-last-sexp
            "C-c C-r C-e C-b" 'geiser-eval-buffer
            "C-c C-r C-e C-x" 'geiser-eval-interrupt

            "C-c C-r C-h" (cons "doc" (make-sparse-keymap))
            "C-c C-r C-h C-h" 'geiser-doc-symbol-at-point
            "C-c C-r C-h C-m" 'geiser-doc-module
            "C-c C-r C-h C-S-H" 'geiser-doc-look-up-manual

            "C-c r" 'run-scheme

            "C-c C-e" (cons "eval" (make-sparse-keymap))
            "C-c C-e C-r" 'scheme-send-region
            "C-c C-e C-d" 'scheme-send-definition
            "C-c C-e C-e" 'scheme-send-last-sexp

            "C-c C-l" 'scheme-load-file)))
