;; -*- lexical-binding: t -*-

(use-package general
  :init
  (general-auto-unbind-keys)
  (general-create-definer tyrant-def
    :prefix (kbd "C-z")))

(def!
 "C-9" 'insert-parentheses

 "C-b" (cons "buffers" (make-sparse-keymap))
 "C-b C-d" 'kill-current-buffer
 "C-b C-b" 'ibuffer

 "C-o" (cons "launchers" (make-sparse-keymap))
 "C-o C-e" 'eshell
 "C-o C-p" 'list-processes
 "C-o C-i" 'ielm
 "C-o C-s" 'scratch-buffer
 "C-o C-w" 'whitespace-mode

 "C-q" (cons "emacs" (make-sparse-keymap))
 "C-q C-q" 'delete-frame
 "C-q C-k" 'save-buffers-kill-emacs
 "C-q C-S-K" 'kill-emacs
 "C-q C-r" (cons "reset" (lambda ()
                      (interactive)
                      (scratch-buffer)
                      (delete-other-windows)
                      (delete-other-frames)
                      (dolist (buf (buffer-list))
                        (unless (member (buffer-name buf) '("*scratch*" "*Messages*" "*Warnings*"))
                          (kill-buffer (buffer-name buf))))))

 "C-," 'beginning-of-buffer
 "C-." 'end-of-buffer)

(bind-key (kbd "C-\\") #'insert-lambda)
