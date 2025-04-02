;; -*- lexical-binding: t -*-

(hooks! hs-minor-mode-hook
        (lambda ()
          (tyrant-def
            "C-f" #'hs-toggle-hiding)))

;;; C ;;;
(use-package cmake-mode)
(rlhooks! (c-mode-hook c++-mode-hook) (#'lsp #'hs-minor-mode))

(setq c-basic-offset 4)
(setq c++-basic-offset 4)

;;; C# ;;;
(hooks! csharp-mode-hook #'hs-minor-mode #'lsp)

;;; JavaScript ;;;
(use-package jsdoc)
(use-package lorem-ipsum)
(use-package typescript-mode)
(use-package prettier-js)

(rlhooks! (typescript-mode-hook js-mode-hook)
          (#'hs-minor-mode #'lsp #'prettier-js-mode
                           (lambda ()
                             (tyrant-def
                               "C-c" (cons "javascript" (make-sparse-keymap))
                               "C-c C-d" 'jsdoc
                               "C-c C-l" (cons "lorem" (make-sparse-keymap))
                               "C-c C-l C-l" #'lorem-ipsum-insert-paragraphs
                               "C-c C-l C-s" #'lorem-ipsum-insert-sentences
                               "C-c C-l C-i" #'lorem-ipsum-insert-list))))

;;; PHP ;;;
(use-package php-mode)
(hooks! php-mode-hook #'hs-minor-mode)

;;; Java ;;;
(hooks! java-mode-hook #'hs-minor-mode
        #'lsp
        (lambda ()
          (tyrant-def
            "C-c" (cons "java" (make-sparse-keymap))
            "C-c C-r" #'gradle-list-run-task)))
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
            "C-c" (cons "rust" (make-sparse-keymap))
            "C-c C-c" (cons "cargo" (make-sparse-keymap))
            "C-c C-c C-f" 'rustic-cargo-fmt
            "C-c C-c C-a" 'rustic-cargo-add
            "C-c C-c C-i" 'rustic-cargo-init
            "C-c C-c C-t" 'rustic-cargo-test
            "C-c C-c C-r" 'rustic-cargo-run
            "C-c C-p" 'rustic-popup
            "C-c C-r" 'rustic-reload
            "C-c C-S-C" 'rustic-compile
            "C-c C-f" 'rustic-format-buffer)))

;;; Clojure ;;;
(use-package cider
  :init
  (hooks! clojure-mode-hook
          (lambda ()
            (tyrant-def
              "C-c" (cons "clojure" (make-sparse-keymap))
              "C-c C-c" (cons "cider" (make-sparse-keymap))
              "C-c C-c C-j" 'cider-jack-in
              "C-c C-c C-e" (cons "eval" (make-sparse-keymap))
              "C-c C-c C-e C-b" 'cider-load-buffer
              "C-c C-c C-e C-f" 'cider-load-all-files
              "C-c C-c C-e C-c" 'cider-eval-defun-to-comment
              "C-c C-c C-e C-e" 'cider-eval-defun-at-point
              "C-c C-c C-t" (cons "test" 'cider-test-commands-map))))
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
(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(hooks! web-mode-hook
        (lambda ()
          (tyrant-def
            "C-c" (cons "web" (make-sparse-keymap))
            "C-c C-l" (cons "lorem" (make-sparse-keymap))
            "C-c C-l C-l" #'lorem-ipsum-insert-paragraphs
            "C-c C-l C-s" #'lorem-ipsum-insert-sentences
            "C-c C-l C-i" #'lorem-ipsum-insert-list)))

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
  (setq inferior-lisp-program "ros run"))
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
            "C-c" (cons "lisp" (make-sparse-keymap))
            "C-c C-s" 'sly
            "C-c C-r" 'sly-restart-inferior-lisp
            "C-c C-a" 'sly-apropos
            "C-c C-k" 'sly-thread-kill
            "C-c C-c" 'sly-mrepl-clear-repl

            "C-c C-e" (cons "eval" (make-sparse-keymap))
            "C-c C-e C-e" 'sly-eval-last-expression
            "C-c C-e C-b" 'sly-eval-buffer
            "C-c C-e C-r" 'sly-eval-region
            "C-c C-e C-m" 'sly-eval-macroexpand

            "C-c C-h" (cons "help" (make-sparse-keymap))
            "C-c C-h C-s" 'sly-describe-symbol
            "C-c C-h C-d" 'sly-documentation
            "C-c C-h C-h" 'sly-documentation-lookup

            "C-c C-m" (cons "macroexpand" (make-sparse-keymap))
            "C-c C-m C-m" 'sly-macroexpand-1
            "C-c C-m C-S-M" 'sly-macroexpand-all
            "C-c C-m C-i" 'sly-macroexpand-1-inplace
            "C-c C-m C-S-I" 'sly-macroexpand-all-inplace
            "C-c C-m C-a" 'sly-macroexpand-again
            "C-c C-m C-u" 'sly-macroexpand-undo)))

(hooks! sly-mode-hook
        (lambda ()
          (local-set-key (kbd "M-RET") #'sly-mrepl-return)))

;;; Racket ;;;
(use-package racket-mode)
(hooks! racket-mode-hook #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "C-c" (cons "racket" (make-sparse-keymap))
            "C-c C-r" (cons "run" (make-sparse-keymap))
            "C-c C-r C-r" 'racket-run-and-switch-to-repl
            "C-c C-r C-t" 'racket-test
            "C-c C-r C-R" 'racket-racket
            "C-c C-h" (cons "help" (make-sparse-keymap))
            "C-c C-h C-h" 'racket-repl-describe
            "C-c C-h C-d" 'racket-documentation-search)))

;;; Scheme ;;;
;; (load! package/scheme/chez)
;; (load! package/scheme/chicken)
;; (load! package/scheme/gambit)
;; (load! package/scheme/gerbil)

;;; Haskell ;;;
(use-package haskell-mode)
(use-package lsp-haskell)
(hooks! haskell-mode-hook #'hs-minor-mode #'lsp
        (lambda ()
          (tyrant-def
            "C-c" (cons "haskell" (make-sparse-keymap)))))

;;; Docker ;;;
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-ts-mode))
(use-package docker-compose-mode)
