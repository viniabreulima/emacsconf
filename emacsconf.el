;;;;;;;;;;;;;;;; My confs for Emacs ;;;;;;;;;;;;;;;;
;; https://github.com/viniabreulima/emacsconf.git ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Quick install:
;; (add-to-list 'load-path "~/.emacs.d/emacsconf/")
;; (load "~/.emacs.d/emacsconf/emacsconf.el")

; Setting encoding preferences
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; Some default variables
(setq tab-width 4)

; Loading theme
(load-theme 'zenburn t)

; Configuring IDO
(setq confirm-nonexistent-file-or-buffer nil)
(require 'ido)
(require 'ido-better-flex)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
(setq ido-show-dot-for-dired t) ;; put . as the first item
;(setq ido-use-filename-at-point t) ;; prefer files names near point
(setq ido-use-filename-at-point 'guess) 

; Shortcut to resize buffer to 80 columns
(defun fix-window-horizontal-size (width)
  "Set the window's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 80) (window-width)) 'horizontal))
(global-set-key (kbd "C-x W") 'fix-window-horizontal-size)

; Configuring vertical indicator to 80 columns
(require 'fill-column-indicator)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(add-hook 'after-change-major-mode-hook (lambda()
					  (setq fci-rule-column 80)
					  (setq fci-rule-use-dashes nil)
))

; Setting line highlight
(global-hl-line-mode +1)

; Setting line numbers
(global-linum-mode t)
(setq linum-format "%3s ")


; Setting default indentation of python-hook
(add-hook 'python-mode-hook (lambda () (setq python-indent 4)))

; Configuring Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
