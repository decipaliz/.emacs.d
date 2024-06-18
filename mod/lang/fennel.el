;; -*- lexical-binding: t -*-

(package! (fennel-mode :repo "https://git.sr.ht/~technomancy/fennel-mode"))

(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))
(hooks! fennel-mode-hook #'hs-minor-mode)
(when! lispy
       (hooks! fennel-mode-hook #'enable-paredit-mode #'rainbow-delimiters-mode))
(when! lsp
       (with-eval-after-load 'lsp-mode
         (add-to-list 'lsp-language-id-configuration '(fennel-mode . "fennel"))
         (lsp-register-client
          (make-lsp-client :new-connection (lsp-stdio-connection "fennel-ls")
                           :activation-fn (lsp-activate-on "fennel")
                           :server-id 'fennel-ls)))
       (hooks! fennel-mode-hook #'lsp))
