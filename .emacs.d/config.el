(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(global-set-key (kbd "<M-return>") 'ansi-term) ;; open terminal with M-RET

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq make-backup-file nil) ;; stops making those ~ files

(defalias 'yes-or-no-p 'y-or-n-p) ;; turns "yes" and "no" questions to "y" and "p"
(when window-system (global-hl-line-mode t)) ;; highlights the entire line (gui only) - may remove later... testing it out

(blink-cursor-mode 0) ;; removes the blinking cursor

(when window-system (global-prettify-symbols-mode t)) ;; pretty symbols

(setq scroll-conservatively 100) ;; makes the scrolling nicer

(setq ring-bell-function 'ignore) ;; delete bell sound

;; cleaning up the gui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t)

(org-indent-mode 1)

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1)) ;; this makes the menu vertical for easier legibility

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert 1)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package rainbow-mode
  :ensure t
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
    (add-hook hook 'rainbow-mode)))
