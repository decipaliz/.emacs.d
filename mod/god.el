;; -*- lexical-binding: t -*-

(setq god-mode-enable-function-key-translation nil)

(package! god-mode
          (god-mode))

(after!
 (global-set-key (kbd "<escape>") #'god-mode-all)
 (define-key god-local-mode-map (kbd ".") #'repeat))
