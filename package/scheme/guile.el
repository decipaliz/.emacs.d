;; -*- lexical-binding: t -*-

(use-package geiser)
(use-package geiser-guile)
(setq scheme-program-name "guile")

(hooks! scheme-mode-hook #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "C-c" (cons "scheme" (make-sparse-keymap))
            "C-c C-r" (cons "geiser" (make-sparse-keymap))
            "C-c C-r C-r" 'geiser-mode-switch-to-repl
            "C-c C-r C-S-R" 'geiser
            "C-c C-r C-l" 'geiser-load-file
            "C-c C-r C-s" 'geiser-restart-repl
            "C-c C-r C-e" 'geiser-exit-repl
            "C-c C-e" (cons "eval" (make-sparse-keymap))
            "C-c C-e C-e" 'geiser-eval-definition
            "C-c C-e C-r" 'geiser-eval-region
            "C-c C-e C-s" 'geiser-eval-last-sexp
            "C-c C-e C-b" 'geiser-eval-buffer
            "C-c C-e C-x" 'geiser-eval-interrupt
            "C-c C-h" (cons "doc" (make-sparse-keymap))
            "C-c C-h C-h" 'geiser-doc-symbol-at-point
            "C-c C-h C-m" 'geiser-doc-module
            "C-c C-h C-S-H" 'geiser-doc-look-up-manual)))
