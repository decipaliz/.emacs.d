;;; custom.el --- Custom file config. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(after!
 (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
 (load custom-file t t))

;;; custom.el ends here
