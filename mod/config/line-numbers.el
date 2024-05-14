;;; line-numbers.el --- Line number config. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(before!
 (add-hook 'prog-mode-hook #'hl-line-mode)
 (setq display-line-numbers-type 'relative)
 (global-display-line-numbers-mode))

;;; line-numbers.el ends here
