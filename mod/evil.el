;;; evil.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(before!
 (setq evil-want-keybinding nil))

(package! evil
          (bind-key "<escape>" 'keyboard-escape-quit)
          (setq evil-undo-system 'undo-redo)
          (evil-mode 1))

(after!
 (define-key evil-motion-state-map (kbd "RET") nil))

(package! evil-collection
          (setq evil-want-integration t)
          (evil-collection-init))

;;; evil.el ends here
