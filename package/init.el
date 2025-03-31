;; -*- lexical-binding: t -*-

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))
(elpaca-wait)

(setq evil-want-keybinding nil)
(setq evil-undo-system 'undo-redo)
(use-package evil
  :init
  (evil-mode 1))
(use-package evil-collection
  :init
  (setq evil-want-integration t)
  (evil-collection-init))

;; (setq god-mode-enable-function-key-translation nil)
;; (use-package god-mode
;;   :init
;;   (god-mode))
;; (global-set-key (kbd "<escape>") #'god-mode-all)
;; (define-key god-local-mode-map (kbd ".") #'repeat)

(load! package/general)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package doom-themes
  :init
  (load-theme 'doom-gruvbox t))

(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode +1))
(use-package ivy-rich
  :init
  (ivy-rich-mode +1))

(use-package counsel
  :init
  (counsel-mode +1))

(use-package which-key
  :init
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.01
        which-key-max-description-length 32
        which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-allow-evil-operators t)
  (which-key-mode +1)
  ;; (which-key-enable-god-mode-support)
  )

(use-package vterm
  :init
  (hooks! vterm-mode-hook (lambda () (display-line-numbers-mode -1))))
(def! "`" 'vterm)

(use-package yasnippet
  :init
  (setq yas-nippet-dir "~/.emacs.d/snippets")
  
  (yas-global-mode +1))
(use-package yasnippet-snippets)
(def!
 "y" (cons "yasnippet" (make-sparse-keymap))
 "yn" 'yas-new-snippet
 "ys" 'yas-insert-snippet
 "yv" 'yas-visit-snippet-file)

(use-package transient)
(use-package magit)
(use-package magit-section)
(use-package gitignore-templates)
(use-package git-gutter
  :init
  (global-git-gutter-mode +1))
(def!
 "g" (cons "git" (make-sparse-keymap))
 "gg" 'magit
 "gi" 'gitignore-templates-new-file
 "gI" 'gitignore-templates-insert
 "gb" 'magit-blame
 "gl" 'magit-log-buffer-file)

(use-package company
  :init
  (global-company-mode +1)
  (define-key evil-insert-state-map (kbd "TAB") 'company-indent-or-complete-common))

(use-package lsp-mode
  :init
  (hooks! lsp-mode-hook
          (lambda ()
            (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
            (lsp-headerline-breadcrumb-mode)
            (tyrant-def "l" lsp-command-map)))
  (setq lsp-enable-which-key-integration t))
(use-package lsp-ui
  :init
  (hooks! lsp-mode-hook #'lsp-ui-mode))
(use-package lsp-ivy)

(use-package flycheck
  :init
  (global-flycheck-mode +1)
  (hooks! flycheck-mode-hook
          (lambda ()
            (tyrant-def
              "1" (cons "flycheck" (make-sparse-keymap))
              "1 C-c" 'flycheck-compile
              "1 C-w" 'flycheck-copy-errors-as-kill
              "1?" 'flycheck-describe-checker
              "1C" 'flycheck-clear
              "1H" 'display-local-help
              "1V" 'flycheck-version
              "1c" 'flycheck-buffer
              "1e" 'flycheck-explain-error-at-point
              "1h" 'flycheck-display-error-at-point
              "1i" 'flycheck-manual
              "1l" 'flycheck-list-errors
              "1n" 'flycheck-next-error
              "1p" 'flycheck-previous-error
              "1s" 'flycheck-select-checker
              "1v" 'flycheck-verify-setup
              "1x" 'flycheck-disable-checker))))

(use-package projectile
  :init
  (projectile-mode +1))
(def!
 "p" (cons "projectile" 'projectile-command-map)
 "pa" 'projectile-add-known-project)

(use-package rg)

(use-package nerd-icons)
(use-package all-the-icons)
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

(use-package hl-todo
  :init
  (global-hl-todo-mode +1))

(hooks! org-mode-hook
        (lambda ()
          (org-indent-mode)
          (variable-pitch-mode 1)
          (visual-line-mode 1)
          
          (setq org-ellipsis " ▾")
          (font-lock-add-keywords 'org-mode
                                  '(("^ *\\([-]\\) "
                                     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
          (setq org-agenda-files
                '("~/Documents/org/tasks.org"
                  "~/Documents/org/birthdays.org"))
          (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
          (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
          (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
          (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
          (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)))
(use-package visual-fill-column
  :init
  (hooks! org-mode-hook
          (lambda ()
            (setq visual-fill-column-width 100
                  visual-fill-column-center-text t)
            (visual-fill-column-mode 1))))
(use-package org-bullets
  :init
  (setq org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
  (hooks! org-mode-hook #'org-bullets-mode))
;; (use-package org-roam
;;   :init
;;   (setq org-roam-directory "~/dev/roam")
;;   (setq org-roam-db-location "~/dev/roam/org-roam.db")
;;   (defun rc/open-roam-dir ()
;;     (interactive)
;;     (dired org-roam-directory))
;;   (org-roam-db-autosync-enable))
(use-package evil-org)
(def! "r" (cons "roam" (make-sparse-keymap))
      "rl" 'org-roam-buffer-toggle
      "rf" 'org-roam-node-find
      "ri" 'org-roam-node-insert
      "ro" 'org-open-at-point
      "rd" 'rc/open-roam-dir)

;; (use-package elcord
;;   :init
;;   (setq elcord-display-buffer-details nil)
;;   (setq elcord-show-small-icon nil)
;;   (setq elcord-idle-timer 604800))

(use-package paredit)
(use-package rainbow-delimiters)

(require 'cl-extra)
(use-package centaur-tabs
  :init
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-plain-icons t)
  (setq centaur-tabs-style "alternate")
  (setq centaur-tabs-set-close-button nil)
  (setq centaur-tabs-show-new-tab-button nil)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-cycle-scope 'tabs)
  (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
  (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)
  (centaur-tabs-mode t))
(def!
 "TAB" 'centaur-tabs-forward
 "<backtab>" 'centaur-tabs-backward
 "C-<tab>" 'centaur-tabs-toggle-groups
 "C-<iso-lefttab>" 'centaur-tabs-local-mode)
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

;; (use-package treemacs)
;; (use-package treemacs-evil)
;; (def!
;;  "e" 'treemacs
;;  "E" 'treemacs-select-directory)

(load! package/lang)

(elpaca-process-queues)
(elpaca-wait)
