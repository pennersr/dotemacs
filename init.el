;;; init.el -- Let's go!
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; UI
(setq ns-use-native-fullscreen nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(nyan-mode)

(defun ui-after-init ()
  (if (display-graphic-p)
      (load-theme 'zenburn))
  (if (fboundp 'toggle-frame-fullscreen)
      (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'ui-after-init)

;; Dired
(setq dired-auto-revert-buffer t)

;; Editing
(require 'auto-complete)

;; Navigation
(windmove-default-keybindings)
;; Windmove in terminal
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)



;;;; dirty fix for having AC everywhere
;;(define-globalized-minor-mode real-global-auto-complete-mode
;;  auto-complete-mode (lambda ()
;;                       (if (not (minibufferp (current-buffer)))
;;                         (auto-complete-mode 1))
;;                       ))
;;(real-global-auto-complete-mode t)
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)

(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; Minibuffer
(setq enable-recursive-minibuffers t)

;; Helm
(require 'helm)
(require 'helm-config)
(require 'helm-projectile)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-ff-skip-boring-files             t)

(helm-mode 1)

;; Projects
(require 'projectile)
(projectile-global-mode)

;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Python
(require 'python-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(set-variable 'flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook 'global-flycheck-mode)
(require 'py-yapf)

;; Shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)

(require 'comint)
(setq comint-password-prompt-regexp
      (concat
       "\\("
       "Password for 'http.*':"
       "\\|"
       "\\w+ password:"
       "\\|"
       comint-password-prompt-regexp
       "\\)"
       ))

;; Vagrant-tramp
(eval-after-load 'tramp
  '(vagrant-tramp-enable))

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
    ("f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
