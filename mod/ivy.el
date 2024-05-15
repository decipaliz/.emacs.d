;; -*- lexical-binding: t -*-

(package! ivy
          (setq ivy-use-virtual-buffers t)
          (setq enable-recursive-minibuffers t)
          (ivy-mode +1))

(package! ivy-rich
          (ivy-rich-mode +1))
