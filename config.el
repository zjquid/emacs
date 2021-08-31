(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(global-set-key (kbd "<M-return>") 'ansi-term) ;; open terminal with M-RET

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq org-agenda-files (list "~/.emacs.d/agenda.org"))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(add-hook 'org-mode-hook #'(lambda ()

			     ;; make the lines in the buffer wrap around the edges of the screen.

			     ;; to press C-c q  or fill-paragraph ever again!
			     (visual-line-mode)
			     (org-indent-mode)))

(setq make-backup-files nil) ;; stops making those ~ files
(setq auto-save-default nil)

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

(use-package all-the-icons
  :ensure t)
;; run M-x all-the-icons-install-fonts

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

;; (setq initial-buffer-choice "~/.emacs.d/splash.org")
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Good Morning, Andrew")
(setq dashboard-startup-banner "~/.emacs.d/splashtext.txt")
(setq dashboard-show-shortcuts nil)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(setq dashboard-set-navigator t) ;; initializes navigator

(setq dashboard-footer-messages (list (shell-command-to-string "~/.emacs.d/fortune.sh") nil))
(setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
						   :height 1.1
						   :v-adjust -0.05
						   :face 'font-lock-keyword-face))

(setq dashboard-week-agenda t)

;; (use-package auctex
;;   :ensure t)
;; figure out why this doesn't work

;; (add-to-list 'default-frame-alist '(font . "Hack Nerd Font Mono-15"))
;; (set-face-attribute 'default t :font "Hack Nerd Font Mono-15")
