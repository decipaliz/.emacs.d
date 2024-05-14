;;; general.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(package! general
          (general-auto-unbind-keys)
          (general-create-definer def!
            :keymaps '(normal insert visual motion emacs)
            :prefix "SPC"
            :global-prefix (kbd "C-c u")))

(after!
 (def!
  "`" '("shell cmd" . shell-command)
  "~" '("async shell cmd" . async-shell-command)

  "9" 'insert-parentheses
  "/" 'comment-line

  "b" (cons "buffers" (make-sparse-keymap))
  "bd" 'kill-this-buffer
  "bb" 'switch-to-buffer
  "bj" 'next-buffer
  "bk" 'previous-buffer
  "br" 'revert-buffer-quick
  "bm" 'ibuffer
  "bs" 'save-some-buffers

  "w" (cons "windows" (make-sparse-keymap))
  "wo" 'delete-other-windows
  "wb" 'balance-windows

  "f" (cons "dired" (make-sparse-keymap))
  "ff" 'find-file
  "fs" 'save-buffer
  "fd" 'dired

  "o" (cons "launchers" (make-sparse-keymap))
  "oe" 'eshell
  "op" 'list-processes
  "oi" 'ielm
  "os" 'scratch-buffer

  "h" (cons "describe" (make-sparse-keymap))
  "hv" 'describe-variable
  "hf" 'describe-function
  "hm" 'describe-mode
  "hk" 'describe-key

  "q" (cons "emacs" (make-sparse-keymap))
  "qq" 'delete-frame
  "qk" 'save-buffers-kill-emacs
  "qK" 'kill-emacs))

;;; general.el ends here
