;;; flycheck.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(package! flycheck
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

;;; flycheck.el ends here
