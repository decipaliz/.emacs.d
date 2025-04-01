;; -*- lexical-binding: t -*-

(add-to-list 'load-path "/usr/local/Gambit/share/emacs/site-lisp")
(require 'gambit)
(defvar gerbil-program-name (expand-file-name "/opt/gerbil/bin/gxi"))
(setq scheme-program-name gerbil-program-name)
(elpaca (gerbil-mode :host github
                     :repo "mighty-gerbils/gerbil"
                     :files ("etc/gerbil-mode.el")
                     :branch "master"))

(defun gerbil-setup-buffers ()
  "Change current buffer mode to gerbil-mode and start a REPL"
  (interactive)
  (gerbil-mode)
  (split-window-right)
  (shrink-window-horizontally 2)
  (let ((buf (buffer-name)))
    (other-window 1)
    (run-scheme "gxi")
    (switch-to-buffer-other-window "*scheme*" nil)
    (switch-to-buffer buf)))

(defun clear-comint-buffer ()
  (interactive)
  (with-current-buffer "*scheme*"
	(let ((comint-buffer-maximum-size 0))
	  (comint-truncate-buffer))))

(hooks! scheme-mode-hook
        #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (tyrant-def
            "C-c" (cons "scheme" (make-sparse-keymap))
            "C-c C-s" (cons "gerbil" (make-sparse-keymap))
            "C-c C-c C-s" 'gerbil-setup-buffers)))

(hooks! gerbil-mode-hook
        #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (when (file-exists-p "~/.gerbil/TAGS") (visit-tags-table "~/.gerbil/TAGS"))
          (when (file-exists-p "~/.gerbil/pkg/TAGS") (visit-tags-table "~/.gerbil/pkg/TAGS")))
        (lambda ()
          (tyrant-def
            "C-c" (cons "scheme" (make-sparse-keymap))
            "C-c C-c" (cons "gerbil" (make-sparse-keymap))
            "C-c C-c C-i" 'gerbil-import-current-buffer
            "C-c C-c C-r" 'gerbil-reload-current-buffer
            "C-c C-c C-c" 'gerbil-compile-current-buffer
            "C-c C-c C-b" 'gerbil-build
            "C-c C-c C-s" 'gerbil-setup-buffers
            "C-c C-m" (cons "comint" (make-sparse-keymap))
            "C-c C-m C-n" 'comint-next-input
            "C-c C-m C-p" 'comint-previous-input
            "C-c C-m C-l" 'clear-comint-buffer)))
