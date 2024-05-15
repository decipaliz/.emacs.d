;; -*- lexical-binding: t -*-

(package! general
          (general-auto-unbind-keys)
          (general-create-definer tyrant-def
            :keymaps '(normal insert visual motion emacs)
            :prefix "SPC"
            :global-prefix (kbd "C-c u")))

(def!
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
 "qK" 'kill-emacs

 "SPC" '("M-x" . execute-extended-command)
 "C-SPC" '("M-x" . execute-extended-command)

 "wh" 'evil-window-left
 "wj" 'evil-window-down
 "wk" 'evil-window-up
 "wl" 'evil-window-right
 "wd" 'evil-window-delete
 "wD" 'kill-buffer-and-window
 "w=" 'evil-window-increase-height
 "w-" 'evil-window-decrease-height
 "w," 'evil-window-decrease-width
 "w." 'evil-window-increase-width
 "ws" 'evil-window-split
 "wv" 'evil-window-vsplit)
