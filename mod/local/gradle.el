;; -*- lexical-binding: t -*-

(when!
 projectile

 (require 'cl-extra)

 ;; TODO: maybe use regular expressions like a normal person
 (defun gradle-list--get-tasks ()
   (message (projectile-project-root))
   (let* ((res (shell-command-to-string (format "(cd %s; ./gradlew tasks --all --console plain)" (projectile-project-root))))
          (res (split-string res "\n"))
          (res (cl-remove-if-not (lambda (x) (let ((seq (member ?- (string-to-list x))))
                                               (and seq
                                                    (char-equal ?\s (cadr seq)))))
                                 res)))
     (mapcar (lambda (x) (car (split-string x " - "))) res)))

 (defun gradle-list-run-task (task)
   "Run gradle TASK."
   (interactive
    (list (completing-read "task: "
                           (gradle-list--get-tasks)
                           nil t)))
   (async-shell-command (format "(cd %s; ./gradlew %s)" (projectile-project-root) task))))

