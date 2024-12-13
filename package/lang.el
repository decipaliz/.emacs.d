;; -*- lexical-binding: t -*-

;;; C ;;;
(use-package cmake-mode)
(rlhooks! (c-mode-hook c++-mode-hook) (#'lsp #'hs-minor-mode))

(setq c-basic-offset 4)
(setq c++-basic-offset 4)

;;; C# ;;;
(hooks! csharp-mode-hook #'hs-minor-mode #'lsp)

;;; JavaScript ;;;
(use-package jsdoc)
(use-package typescript-mode)

(rlhooks! (typescript-mode-hook js-mode-hook)
          (#'hs-minor-mode #'lsp
                           (lambda ()
                             (tyrant-def
                               "c" (cons "javascript" (make-sparse-keymap))
                               "cd" 'jsdoc))))

;;; Java ;;;
(hooks! java-mode-hook #'hs-minor-mode
        #'lsp
        (lambda ()
          (tyrant-def
            "c" (cons "java" (make-sparse-keymap))
            "cg" #'gradle-list-run-task)))
(use-package hydra)
(use-package lsp-java)

;;; Python ;;;
(hooks! python-mode-hook #'hs-minor-mode #'lsp)

;;; Lua ;;;
(use-package lua-mode
  :init
  (setq lua-indent-level 4))
(hooks! lua-mode-hook #'hs-minor-mode #'lsp)

;;; Rust ;;;
(use-package rustic)

(hooks! rust-mode-hook
        #'hs-minor-mode
        #'lsp
        (lambda ()
          (tyrant-def
            "c" (cons "rust" (make-sparse-keymap))
            "cc" (cons "cargo" (make-sparse-keymap))
            "ccf" 'rustic-cargo-fmt
            "cca" 'rustic-cargo-add
            "cci" 'rustic-cargo-init
            "cct" 'rustic-cargo-test
            "ccr" 'rustic-cargo-run
            "cp" 'rustic-popup
            "cr" 'rustic-reload
            "cC" 'rustic-compile
            "cf" 'rustic-format-buffer)))

;;; Clojure ;;;
(use-package cider
  :init
  (hooks! clojure-mode-hook
          (lambda ()
            (tyrant-def
              "c" (cons "clojure" (make-sparse-keymap))
              "cc" (cons "cider" (make-sparse-keymap))
              "ccj" 'cider-jack-in
              "cce" (cons "eval" (make-sparse-keymap))
              "cceb" 'cider-load-buffer
              "ccef" 'cider-load-all-files
              "ccec" 'cider-eval-defun-to-comment
              "ccee" 'cider-eval-defun-at-point
              "cct" (cons "test" 'cider-test-commands-map))))
  (rhooks! (clojure-mode-hook cider-mode-hook)
	   (#'hs-minor-mode #'lsp #'enable-paredit-mode #'rainbow-delimiters-mode)))



;;; Go ;;;
(use-package go-mode)
(hooks! go-mode-hook #'hs-minor-mode #'lsp)
(setq-default tab-width 4)

;;; Zig ;;;
(use-package zig-mode)
(hooks! zig-mode-hook #'hs-minor-mode #'lsp)

;;; HTML ;;;
(hooks! html-mode-hook #'hs-minor-mode)

;;; CSS ;;;
(rlhooks! (css-mode-hook scss-mode-hook) (#'hs-minor-mode #'lsp))

;;; Fennel ;;;
(elpaca (fennel-mode :repo "https://git.sr.ht/~technomancy/fennel-mode"))
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

(hooks! fennel-mode-hook #'hs-minor-mode #'lsp
        #'enable-paredit-mode #'rainbow-delimiters-mode)
(with-eval-after-load 'lsp-mode
         (add-to-list 'lsp-language-id-configuration '(fennel-mode . "fennel"))
         (lsp-register-client
          (make-lsp-client :new-connection (lsp-stdio-connection "fennel-ls")
                           :activation-fn (lsp-activate-on "fennel")
                           :server-id 'fennel-ls)))

;;; Ren’Py ;;;
(elpaca (renpy :host github :repo "Reagankm/renpy-mode"))

;;; Lisp ;;;
(setq flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
(use-package sly
  :init
          (setq inferior-lisp-program "ros -L sbcl-bin/2.4.0 run"))
(rlhooks! (emacs-lisp-mode-hook
           eval-expression-minibuffer-setup-hook
           ielm-mode-hook
           lisp-interaction-mode-hook
           lisp-mode-hook
           sly-mode-hook)
          (#'enable-paredit-mode #'rainbow-delimiters-mode))
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

;;; Racket ;;;
(use-package racket-mode)
(hooks! racket-mode-hook #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "c" (cons "racket" (make-sparse-keymap))
            "cr" (cons "run" (make-sparse-keymap))
            "crr" 'racket-run-and-switch-to-repl
            "crt" 'racket-test
            "crR" 'racket-racket
            "ch" (cons "help" (make-sparse-keymap))
            "chh" 'racket-repl-describe
            "chd" 'racket-documentation-search)))

;;; Scheme ;;;
;; (load! package/scheme/chez)
;; (load! package/scheme/chicken)
;; (load! package/scheme/gambit)
(load! package/scheme/gerbil)
