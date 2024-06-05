;; -*- lexical-binding: t -*-

(defvar core/before-load-hook '()
  "List of functions called before loading all the packages.")

(defvar core/during-load-hook '()
  "List of functions called during package load.")

(defvar core/after-during-load-hook '()
  "List of functions called immediately after `core/during-load-hook`.")

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
  "Install package PACKAGE and run BODY after package load."
  `(progn
     (add-hook 'core/during-load-hook
               (lambda ()
                 (elpaca ,package)))
     (add-hook 'core/after-during-load-hook
               (lambda ()
                 ,@body))))

(defmacro init! (&rest body)
  "Run BODY after all Emacs is fully loaded."
  `(add-hook 'after-init-hook
             (lambda ()
               ,@body)))

(defvar core/module-list '()
  "The list of modules that exist.")

(defcustom core/enabled-modules-list '()
  "The list of modules that are enabled.")

(defmacro modlist! (&rest modlist)
  `(setq core/module-list (append core/module-list
                                  ',(mapcar (lambda (mod)
                                              (if (stringp mod) mod (symbol-name mod)))
                                            modlist))))

(defun core/load-mods ()
  "Load all the modules from `core/enabled-modules-list`."
  (dolist (mod core/enabled-modules-list)
    (let ((filename (expand-file-name (concat "mod/" mod ".el") user-emacs-directory)))
      (when (file-exists-p filename)
        (load-file filename)))))
