;;; init.el -- Let's go!
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; UI
(setq ns-use-native-fullscreen nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(defun ui-after-init ()
  (load-theme 'zenburn)
  (if (fboundp 'toggle-frame-fullscreen)
      (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'ui-after-init)

;; Editing
(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(smartparens-global-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; Minibuffer
(setq enable-recursive-minibuffers t)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(ido-mode)
(ido-ubiquitous-mode)
(setq ido-enable-flex-matching t)

;; Python
(require 'python-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(set-variable 'flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Shell
(require 'comint)
(setq comint-password-prompt-regexp
      (concat
       "\\("
       "Password for 'http.*':"
       "\\|"
       comint-password-prompt-regexp
       "\\)"
       ))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq-default show-trailing-whitespace t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
