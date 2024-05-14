;;; mod.el --- Module macros and utilities. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar core/before-load-hook '()
  "List of functions called before loading all the packages.")

(defvar core/during-load-hook '()
  "List of functions called during package load.")

(defvar core/after-load-hook '()
  "List of functions called after loading all the packages.")

(defmacro before! (&rest body)
  "Run BODY before any package is loaded."
  `(add-hook 'core/before-load-hook
             (lambda ()
               ,@body)))

(defmacro during! (&rest body)
  "Run BODY before during package load."
  `(add-hook 'core/during-load-hook
             (lambda ()
               ,@body)))

(defmacro after! (&rest body)
  "Run BODY after all packages are loaded."
  `(add-hook 'core/after-load-hook
             (lambda ()
               ,@body)))

(defmacro package! (package &rest body)
  "Install package PACKAGE and run BODY during package load."
  `(add-hook 'core/during-load-hook
             (lambda ()
               (elpaca ,package ,@body))))

(defmacro init! (&rest body)
  "Run BODY after all Emacs is fully loaded."
  `(add-hook 'after-init-hook
             (lambda ()
               ,@body)))

(defun core/load-mods (modlist disabled)
  "Load all the modules from MODLIST, while ignoring everything in DISABLED."
  (dolist (mod (seq-filter (lambda (mod)
                             (not (member mod disabled)))
                           modlist))
    (load-file (expand-file-name (concat "mod/" mod ".el") user-emacs-directory))))

;;; mod.el ends here
