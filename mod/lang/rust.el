;; -*- lexical-binding: t -*-

(package! rustic)

(hooks! rust-mode-hook
        #'hs-minor-mode
        (lambda ()
          (tyrant-def
            "c" (cons "rust" (make-sparse-keymap))
            "cc" (cons "cargo" (make-sparse-keymap))
            "ccf" 'rustic-cargo-fmt
            "cca" 'rustic-cargo-add
            "cci" 'rustic-cargo-init
            "cct" 'rustic-cargo-test
            "ccr" 'rustic-cargo-run
            "cp" 'rustic-popup
            "cr" 'rustic-reload
            "cC" 'rustic-compile
            "cf" 'rustic-format-buffer)))
