;; -*- lexical-binding: t -*-

(package! treemacs)
(when! evil
       (package! treemacs-evil))
(def!
 "e" 'treemacs
 "E" 'treemacs-select-directory)
