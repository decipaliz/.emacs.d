;; -*- lexical-binding: t -*-

(use-package geiser :demand t)
(use-package geiser-chez :demand t)
(setq scheme-program-name "scheme")
(hooks! scheme-mode-hook #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "c" (cons "scheme" (make-sparse-keymap))
            "cg" (cons "geiser" (make-sparse-keymap))
            "cgg" 'geiser-mode-switch-to-repl
            "cgG" 'geiser
            "cgl" 'geiser-load-file
            "cgr" 'geiser-restart-repl
            "cge" 'geiser-exit-repl
            "ce" (cons "eval" (make-sparse-keymap))
            "cee" 'geiser-eval-definition
            "cer" 'geiser-eval-region
            "ces" 'geiser-eval-last-sexp
            "ceb" 'geiser-eval-buffer
            "cex" 'geiser-eval-interrupt
            "ch" (cons "doc" (make-sparse-keymap))
            "chh" 'geiser-doc-symbol-at-point
            "chm" 'geiser-doc-module
            "chH" 'geiser-doc-look-up-manual)))
