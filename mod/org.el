;; -*- lexical-binding: t -*-

(hooks! org-mode-hook
        (lambda ()
          (org-indent-mode)
          (variable-pitch-mode 1)
          (visual-line-mode 1)
          
          (setq org-ellipsis " ▾")
          (font-lock-add-keywords 'org-mode
                                  '(("^ *\\([-]\\) "
                                     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
          (setq org-agenda-files
                '("~/Documents/org/tasks.org"
                  "~/Documents/org/birthdays.org"))
          (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
          (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
          (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
          (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
          (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
          (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
          (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)))


(package! visual-fill-column
          (hooks! org-mode-hook
                  (lambda ()
                    (setq visual-fill-column-width 100
                          visual-fill-column-center-text t)
                    (visual-fill-column-mode 1))))

(package! org-bullets
          (setq org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
          (hooks! org-mode-hook #'org-bullets-mode))

;; (package! org-roam
;;           (setq org-roam-directory "~/dev/roam")
;;           (setq org-roam-db-location "~/dev/roam/org-roam.db")
;;           (defun rc/open-roam-dir ()
;;             (interactive)
;;             (dired org-roam-directory))
;;           (org-roam-db-autosync-enable))

(when! evil
       (package! evil-org))

(def! "r" (cons "roam" (make-sparse-keymap))
      "rl" 'org-roam-buffer-toggle
      "rf" 'org-roam-node-find
      "ri" 'org-roam-node-insert
      "ro" 'org-open-at-point
      "rd" 'rc/open-roam-dir)
