;; -*- lexical-binding: t -*-

(require 'cl-extra)
(define-derived-mode modlist-mode special-mode "Modlist"
  "A major mode for editing the modlist."
  (buffer-disable-undo)
  (modlist-mode--update))

(define-key modlist-mode-map (kbd "RET") #'modlist-mode-switch-mod)
(define-key modlist-mode-map (kbd "SPC") #'modlist-mode-switch-mod)
(define-key modlist-mode-map [mouse-1] #'modlist-mode-switch-mod)
(define-key modlist-mode-map (kbd "e") #'modlist-mode-edit-mod)
(define-key modlist-mode-map [mouse-3] #'modlist-mode-edit-mod)
(define-key modlist-mode-map (kbd "q") #'kill-buffer-and-window)
(define-key modlist-mode-map (kbd "j") #'next-line)
(define-key modlist-mode-map (kbd "k") #'previous-line)
(define-key modlist-mode-map (kbd "n") #'next-line)
(define-key modlist-mode-map (kbd "p") #'previous-line)

(defvar modlist-mode--starting-index 1)

(defun modlist-mode--get-selected-mod ()
  (nth (- (line-number-at-pos (line-beginning-position)) modlist-mode--starting-index) core/module-list))

(defun modlist-mode--switch-mod (mod)
  (if (member mod core/enabled-modules-list)
      (cl-remove-if (lambda (x) (string-equal mod x)) core/enabled-modules-list)
    (append core/enabled-modules-list (list mod))))

(defun modlist-mode--insert-modlist ()
  (dolist (mod core/module-list)
    (insert (if (member mod core/enabled-modules-list) "✔️ " "❌ "))
    (insert mod)
    (insert "\n")))

(defun modlist-mode--update ()
  (let ((pos (point)))
    (setq buffer-read-only nil)
    (erase-buffer)
    (modlist-mode--insert-modlist)
    (setq buffer-read-only t)
    (goto-char (min pos (point-max)))))

(defun modlist-mode-switch-mod ()
  "Switches currently selected mod on or off."
  (interactive)
  (customize-save-variable 'core/enabled-modules-list
                           (modlist-mode--switch-mod (modlist-mode--get-selected-mod)))
  (modlist-mode--update))

(defun modlist-mode-edit-mod ()
  "Opens currently selected mod for editing."
  (interactive)
  (let* ((mod (modlist-mode--get-selected-mod))
         (filename (expand-file-name (format "mod/%s.el" mod) user-emacs-directory)))
    (if (file-exists-p filename)
        (find-file-other-window filename)
      (message (format "The mod `%s` doesn’t have a file." mod)))))

(defun modlist ()
  "Open a new modlist-mode buffer."
  (interactive)
  (if (get-buffer "*Modlist*")
      (progn (switch-to-buffer-other-window "*Modlist*"))
    (generate-new-buffer "*Modlist*")
    (switch-to-buffer-other-window "*Modlist*")
    (modlist-mode)))
