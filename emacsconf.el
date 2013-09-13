;;;;;;;;;;;;;;;; My confs for Emacs ;;;;;;;;;;;;;;;;
;; https://github.com/viniabreulima/emacsconf.git ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Setting load-path
(add-to-list 'load-path ".")

; Setting encoding preferences
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; Some default variables
(setq tab-width 4)

; Configuring IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

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
