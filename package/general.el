;; -*- lexical-binding: t -*-

(use-package general
  :init
  (general-auto-unbind-keys)
  (general-create-definer tyrant-def
    :keymaps '(normal insert visual motion emacs)
    :prefix "SPC"
    :global-prefix (kbd "C-c u"))
  ;; (general-create-definer tyrant-def
  ;;   :prefix (kbd "C-c u"))
  )

(def!
 "x" 'shell-command
 "X" 'async-shell-command

 "9" 'insert-parentheses
 "/" 'comment-line

 "b" (cons "buffers" (make-sparse-keymap))
 "bd" 'kill-current-buffer
 "bb" 'switch-to-buffer
 "bj" 'next-buffer
 "bk" 'previous-buffer
 "br" 'revert-buffer-quick
 "bm" 'ibuffer
 "bs" 'save-some-buffers

 "w" (cons "windows" (make-sparse-keymap))
 "wo" 'other-window
 "wO" 'delete-other-windows
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

 "m" (cons "minor mode" (make-sparse-keymap))
 "mw" 'whitespace-mode

 "h" (cons "describe" (make-sparse-keymap))
 "hv" 'describe-variable
 "hf" 'describe-function
 "hm" 'describe-mode
 "hk" 'describe-key

 "q" (cons "emacs" (make-sparse-keymap))
 "qq" 'delete-frame
 "qk" 'save-buffers-kill-emacs
 "qK" 'kill-emacs
 "qr" (cons "reset" (lambda ()
                      (interactive)
                      (scratch-buffer)
                      (delete-other-windows)
                      (delete-other-frames)
                      (dolist (buf (buffer-list))
                        (unless (member (buffer-name buf) '("*scratch*" "*Messages*" "*Warnings*"))
                          (kill-buffer (buffer-name buf))))))

 "SPC" '("M-x" . execute-extended-command)
 "C-SPC" '("M-x" . execute-extended-command))
