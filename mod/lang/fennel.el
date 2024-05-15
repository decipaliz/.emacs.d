;; -*- lexical-binding: t -*-

(load! pkg/fennel-mode/fennel-mode)

(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))
(hooks! fennel-mode-hook #'hs-minor-mode)
(when! lispy
       (hooks! fennel-mode-hook #'enable-paredit-mode #'rainbow-delimiters-mode))
(when! lsp
       (after! 
        (add-to-list 'lsp-language-id-configuration '(fennel-mode . "fennel"))
        (hooks! fennel-mode-hook #'lsp)
        (lsp-register-client
         (make-lsp-client :new-connection (lsp-stdio-connection (expand-file-name "bin/fennel-ls" user-emacs-directory))
                          :activation-fn (lsp-activate-on "fennel")
                          :server-id 'fennel-ls))))

;; TODO: make fennel-ls and fennel-mode installable through emacs
