;;; evil.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(before!
 (setq evil-want-keybinding nil))

(package! evil
          (setq evil-undo-system 'undo-redo)
          (evil-mode 1))

(package! evil-collection
          (setq evil-want-integration t)
          (evil-collection-init))

;;; evil.el ends here
