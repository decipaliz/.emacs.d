;; -*- lexical-binding: t -*-

(require 'cl-extra)

(package! centaur-tabs
          (setq centaur-tabs-set-icons t)
          (setq centaur-tabs-plain-icons t)
          (setq centaur-tabs-style "alternate")
          (setq centaur-tabs-set-close-button nil)
          (setq centaur-tabs-show-new-tab-button nil)
          (setq centaur-tabs-set-modified-marker t)
          (setq centaur-tabs-cycle-scope 'tabs)
          (centaur-tabs-mode t))

(when! evil
       (after!
        (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
        (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)))

(when! general
       (after!
        (tyrant-def
          "TAB" 'centaur-tabs-forward
          "<backtab>" 'centaur-tabs-backward
          "C-<tab>" 'centaur-tabs-toggle-groups
          "C-<iso-lefttab>" 'centaur-tabs-local-mode)))

(defvar centaur-tabs-blacklist '("*epc"
                                 "*helm"
                                 "*Helm"
                                 "*Compile-Log*"
                                 "*lsp"
                                 "*company"
                                 "*Flycheck"
                                 "*tramp"
                                 " *Mini"
                                 "*help"
                                 "*straight"
                                 " *temp"
                                 "*Help"
                                 "*mybuf"

                                 "*scratch"
                                 "*Async"
                                 "*Warnings"
                                 "*Messages"))

(defun centaur-tabs-hide-tab (tab)
  (let ((name (format "%s" tab)))
    (not (cl-some (lambda (x) (string-prefix-p x name)) centaur-tabs-blacklist))))

;; TODO: create groups by keybind, each new buffer adds to current group instead of automatic grouping
