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
            "c" (cons "scheme" (make-sparse-keymap))

            "cg" (cons "geiser" (make-sparse-keymap))
            "cgg" 'geiser-mode-switch-to-repl
            "cgG" 'geiser
            "cgl" 'geiser-load-file
            "cgr" 'geiser-restart-repl
            "cgx" 'geiser-exit-repl

            "cge" (cons "eval" (make-sparse-keymap))
            "cgee" 'geiser-eval-definition
            "cger" 'geiser-eval-region
            "cges" 'geiser-eval-last-sexp
            "cgeb" 'geiser-eval-buffer
            "cgex" 'geiser-eval-interrupt

            "cgh" (cons "doc" (make-sparse-keymap))
            "cghh" 'geiser-doc-symbol-at-point
            "cghm" 'geiser-doc-module
            "cghH" 'geiser-doc-look-up-manual

            "cr" 'run-scheme

            "ce" (cons "eval" (make-sparse-keymap))
            "cer" 'scheme-send-region
            "ced" 'scheme-send-definition
            "cee" 'scheme-send-last-sexp

            "cl" 'scheme-load-file)))
