;; -*- lexical-binding: t -*-

(before!
 (setq evil-want-keybinding nil)
 (setq evil-undo-system 'undo-redo))

(package! evil
          (evil-mode 1))

(package! evil-collection
          (setq evil-want-integration t)
          (evil-collection-init))
