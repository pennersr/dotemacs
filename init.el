;;; init.el -- Let's go!
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq ns-use-native-fullscreen nil)

(defun after-init ()
  (load-theme 'zenburn)
  (toggle-frame-fullscreen))

(add-hook 'after-init-hook 'after-init)

(setq enable-recursive-minibuffers t)
(set-variable 'flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(ido-mode)
(ido-ubiquitous-mode)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

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
