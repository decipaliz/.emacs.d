;; -*- lexical-binding: t -*-

(hooks! java-mode-hook #'hs-minor-mode
        (lambda ()
          (tyrant-def
            "c" (make-sparse-keymap)
            "cg" #'gradle-list-run-task)))
(when! lsp
       (package! hydra)
       (package! lsp-java)
       (hooks! java-mode-hook #'lsp))
