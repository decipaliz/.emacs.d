;; -*- lexical-binding: t -*-

(before!
 (add-to-list 'default-frame-alist '(alpha . 95))
 (add-to-list 'default-frame-alist '(fullscreen . maximized))
 (add-to-list 'default-frame-alist '(undecorated . t))

 (set-face-attribute 'default nil :font "Hack Nerd Font" :height 100)
 (set-face-attribute 'fixed-pitch nil :font "Hack Nerd Font" :height 100)
 (set-face-attribute 'variable-pitch nil :font "Liberation Sans" :height 120))
