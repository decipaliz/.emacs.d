;; -*- lexical-binding: t -*-

(package! cider
          (hooks! clojure-mode-hook
                  (lambda ()
                    (tyrant-def
                      "c" (cons "clojure" (make-sparse-keymap))
                      "cc" (cons "cider" (make-sparse-keymap))
                      "ccj" 'cider-jack-in
                      "cce" (cons "eval" (make-sparse-keymap))
                      "cceb" 'cider-load-buffer
                      "ccef" 'cider-load-all-files
                      "ccec" 'cider-eval-defun-to-comment
                      "ccee" 'cider-eval-defun-at-point
                      "cct" (cons "test" 'cider-test-commands-map)))))

(after!
 (rhooks! #'hs-minor-mode clojure-mode-hook cider-mode-hook)
 (when! lsp (rhooks! #'lsp clojure-mode-hook cider-mode-hook))
 (when! lang/lisp (rlhooks! (clojure-mode-hook cider-mode-hook)
                            (#'enable-paredit-mode #'rainbow-delimiters-mode))))
