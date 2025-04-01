;; -*- lexical-binding: t -*-

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))
(elpaca-wait)

(setq god-mode-enable-function-key-translation nil)
(use-package god-mode
  :init
  (god-mode)
  :config
  (global-set-key (kbd "<escape>") #'god-mode-all)
  (define-key god-local-mode-map (kbd ".") #'repeat))

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
  (which-key-mode +1)
  (which-key-enable-god-mode-support))

(use-package vterm
  :init
  (hooks! vterm-mode-hook (lambda () (display-line-numbers-mode -1))))
(def! "C-`" 'vterm)

(use-package yasnippet
  :init
  (setq yas-nippet-dir "~/.emacs.d/snippets")
  
  (yas-global-mode +1))
(use-package yasnippet-snippets)
(def!
 "C-y" (cons "yasnippet" (make-sparse-keymap))
 "C-y C-n" 'yas-new-snippet
 "C-y C-s" 'yas-insert-snippet
 "C-y C-v" 'yas-visit-snippet-file)

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
  (global-company-mode +1))

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
              "C-1" (cons "flycheck" (make-sparse-keymap))
              "C-1 C-c" 'flycheck-compile
              "C-1 C-w" 'flycheck-copy-errors-as-kill
              "C-1 C-?" 'flycheck-describe-checker
              "C-1 C-S-C" 'flycheck-clear
              "C-1 C-S-H" 'display-local-help
              "C-1 C-S-V" 'flycheck-version
              "C-1 C-c" 'flycheck-buffer
              "C-1 C-e" 'flycheck-explain-error-at-point
              "C-1 C-h" 'flycheck-display-error-at-point
              "C-1 C-i" 'flycheck-manual
              "C-1 C-l" 'flycheck-list-errors
              "C-1 C-n" 'flycheck-next-error
              "C-1 C-p" 'flycheck-previous-error
              "C-1 C-s" 'flycheck-select-checker
              "C-1 C-v" 'flycheck-verify-setup
              "C-1 C-x" 'flycheck-disable-checker))))

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
(use-package org-roam
  :init
  (setq org-roam-directory "~/roam")
  (setq org-roam-db-location "~/roam/org-roam.db")
  (defun rc/open-roam-dir ()
    (interactive)
    (dired org-roam-directory))
  (org-roam-db-autosync-enable))
(def! "C-r" (cons "roam" (make-sparse-keymap))
      "C-r C-l" 'org-roam-buffer-toggle
      "C-r C-f" 'org-roam-node-find
      "C-r C-i" 'org-roam-node-insert
      "C-r C-o" 'org-open-at-point
      "C-r C-d" 'rc/open-roam-dir)

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
  (centaur-tabs-mode t)
  :config
  (global-set-key (kbd "C-<tab>") #'centaur-tabs-forward)
  (global-set-key (kbd "C-<iso-lefttab>") #'centaur-tabs-backward))
(def!
 "TAB" 'centaur-tabs-toggle-groups
 "<backtab>" 'centaur-tabs-local-mode)
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

(load! package/lang)

(elpaca-process-queues)
(elpaca-wait)
