;; -*- lexical-binding: t -*-

(add-to-list 'load-path "/usr/local/Gambit/share/emacs/site-lisp")
(require 'gambit)
(setq scheme-program-name "gsi -:d-")

(hooks! scheme-mode-hook #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "c" (cons "scheme" (make-sparse-keymap))
            "cr" 'run-scheme
            "ce" (cons "eval" (make-sparse-keymap))
            "cer" 'scheme-send-region
            "ced" 'scheme-send-definition
            "cee" 'scheme-send-last-sexp
            "cl" 'scheme-load-file)))
