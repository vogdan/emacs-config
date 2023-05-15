

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 113 :width normal)))))


;; Set some personal info

(setq user-full-name "Bogdan")
(setq user-login-name "bogdan")
(setq user-mail-address "")


;; Quick check for emacs flavor

(setq ic-xemacs-p (string-match "XEmacs" emacs-version))
(setq ic-fsfemacs-p (not ic-xemacs-p))


;; Frame looking

(tool-bar-mode -1)            ; hide toolbar
(set-scroll-bar-mode 'right)  ; put scrollbar to the right
(column-number-mode t)        ; column number in modeline
;(setq-default line-spacing 0) ; extra pixel space between lines


;; Various settings

(setq auto-save-list-file-prefix nil)	; don't recover sessions
(setq inhibit-startup-message t)		; no starting gibberish
(setq truncate-partial-width-windows t)	; wrap at 'fill-column'!!
(setq require-final-newline t)			; add final newline on save
(setq next-line-add-newlines nil)		; this sucks
(setq search-highlight t)				; highlight on search

(setq default-major-mode 'text-mode)	; go by default in text mode
(setq default-tab-width 4)
(setq indent-tabs-mode nil)

(line-number-mode t)					; show point location
(column-number-mode t)

;; auto-revert
(setq revert-without-query (list "emacs-autorevert.log" ".log"))
(setq auto-revert-interval 2)


;;{{{ Screen colors & syntax highlighting

;; (set-face-font 'default "-adobe-courier-medium-r-*-*-12-*-*-*-*-*-*-*")
;; (set-face-font 'bold "-adobe-courier-bold-r-*-*-12-*-*-*-*-*-*-*")
;; (set-face-font 'italic "-adobe-courier-medium-o-*-*-12-*-*-*-*-*-*-*")
;; (set-face-font 'bold-italic "-adobe-courier-bold-o-*-*-12-*-*-*-*-*-*-*")

;; Set some (hopefully) eye-soothing colors (dark background)

(set-face-background 'default "#101020")
(set-face-foreground 'default "#BEB8AB")

(set-face-background 'highlight "#4186be")
(set-face-foreground 'highlight "white")

(copy-face 'highlight 'isearch)

(if ic-xemacs-p
    (progn
      (setq font-lock-auto-fontify t))
  (global-font-lock-mode t)
  )

(require 'font-lock)

(set-face-foreground 'font-lock-comment-face          "gray40")
(set-face-foreground 'font-lock-string-face           "#71bebe")
(set-face-foreground 'font-lock-keyword-face          "#fff796")
(set-face-foreground 'font-lock-type-face             "white")
(set-face-foreground 'font-lock-function-name-face    "#cf9ebe")
(set-face-foreground 'font-lock-variable-name-face    "#968a38")

(if ic-xemacs-p
    (progn
      (set-face-background 'text-cursor                     "green")
      (set-face-foreground 'text-cursor                     "black")
      (set-face-foreground 'font-lock-doc-string-face       "#71bebe")
      (set-face-foreground 'font-lock-preprocessor-face     "#c5f779")
      (set-face-foreground 'font-lock-reference-face        "#963c59")
      )
  (set-cursor-color "green")
  )

;; Set colors for hyper-apropos mode within a hook
(defun ic-hyper-apropos-mode-hook ()
  (set-face-foreground 'hyper-apropos-hyperlink        "#cf6171")
  (set-face-foreground 'hyper-apropos-documentation        "#71bebe")
  )

(add-hook 'hyper-apropos-mode-hook 'ic-hyper-apropos-mode-hook)

;;}}}


(require 'package)
;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use last tagged version
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


;;auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 4)
