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
            "c" (cons "scheme" (make-sparse-keymap))
            "cg" (cons "gerbil" (make-sparse-keymap))
            "cgs" 'gerbil-setup-buffers)))

(hooks! gerbil-mode-hook
        #'hs-minor-mode
        #'enable-paredit-mode #'rainbow-delimiters-mode
        (lambda ()
          (when (file-exists-p "~/.gerbil/TAGS") (visit-tags-table "~/.gerbil/TAGS"))
          (when (file-exists-p "~/.gerbil/pkg/TAGS") (visit-tags-table "~/.gerbil/pkg/TAGS")))
        (lambda ()
          (tyrant-def
            "c" (cons "scheme" (make-sparse-keymap))
            "cg" (cons "gerbil" (make-sparse-keymap))
            "cgi" 'gerbil-import-current-buffer
            "cgr" 'gerbil-reload-current-buffer
            "cgc" 'gerbil-compile-current-buffer
            "cgb" 'gerbil-build
            "cgs" 'gerbil-setup-buffers
            "cc" (cons "comint" (make-sparse-keymap))
            "ccn" 'comint-next-input
            "ccp" 'comint-previous-input
            "ccl" 'clear-comint-buffer)))
