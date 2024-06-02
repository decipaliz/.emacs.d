;; -*- lexical-binding: t -*-

(package! which-key
          (setq which-key-idle-delay 0.4
                which-key-idle-secondary-delay 0.01
                which-key-max-description-length 32
                which-key-sort-order 'which-key-key-order-alpha)
          (setq which-key-allow-evil-operators t)
          (which-key-mode +1))

(after!
 (when! god
        (which-key-enable-god-mode-support)))
