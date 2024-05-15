;; -*- lexical-binding: t -*-

(package! sly
          (setq inferior-lisp-program "ros -L sbcl-bin/2.4.0 run"))

(when! lispy
       (rlhooks! (emacs-lisp-mode-hook
                  eval-expression-minibuffer-setup-hook
                  ielm-mode-hook
                  lisp-interaction-mode-hook
                  lisp-mode-hook
                  sly-mode-hook)
                 (#'enable-paredit-mode #'rainbow-delimiters-mode)))

(hooks! lisp-mode-hook
        #'hs-minor-mode
        (lambda ()
          (tyrant-def
            "c" (cons "lisp" (make-sparse-keymap))
            "cs" 'sly
            "cr" 'sly-reset
            "ca" 'sly-apropos
            "ck" 'sly-thread-kill

            "ce" (cons "eval" (make-sparse-keymap))
            "cee" 'sly-eval-last-expression
            "ceb" 'sly-eval-buffer
            "cer" 'sly-eval-region
            "cem" 'sly-eval-macroexpand)))
