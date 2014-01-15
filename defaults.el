;;Einstellungen von https://github.com/intinig/emacs.d

;; saner buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; the god of modes
(ido-mode t)

;; remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; no more beeps
(setq visible-bell t)

;; save backups and autosaves in a better place
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; pasting over something kills it
(delete-selection-mode 1)

;; just get snippets I installed, nothing else
;;(setq yas/snippet-dirs (concat user-emacs-directory "snippets"))
;;(yas/global-mode 1)

;; textmate behavior for enter key
(global-set-key (kbd "<s-return>") 'textmate-next-line)

;; magit-status
(global-set-key (kbd "C-x g") 'magit-status)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t))

;; we're too lazy to type in yes
(defalias 'yes-or-no-p 'y-or-n-p)

;; initialize it you never know when it might come in handy
(random t)

;; no tabs?
;;(setq-default indent-tabs-mode nil)

;; this thing enables case region commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; zusätzliche Einstellungen


(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;Zeilennummerierung und Theme
(setq linum-format "%3d \u2502")
(load-theme 'solarized-dark t)

;;Einstellungen für Coffeescript:
;;autocomplete, litcoffee-Unterstützung, UI des modus (Autopair und Highlighting der Klammern)
(require 'ac-coffee)
(add-to-list 'auto-mode-alist '("\\.litcoffee$" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
  (make-local-variable 'tab-width)
  (autopair-mode)
  (linum-mode)
  (highlight-parentheses-mode)
  (set 'tab-width 2))
(add-hook 'coffee-mode-hook 'coffee-custom)
(setq x-select-enable-clipboard t)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/2.5.0/")

(global-set-key (kbd "M-q") 'imenu)
 (global-set-key (kbd "^") 'er/expand-region)


  (require 'emmet-mode)
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'html-mode-hook 'linum-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'css-mode-hook  'linum-mode)
;;  (add-hook 'coffee-mode-hook  'linum-mode) -> steht in custom config
(require 'ac-emmet)
 (add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
 (add-hook 'css-mode-hook 'ac-emmet-css-setup)
;;Klammern hervorheben
(require 'autopair)
(show-paren-mode t)


;;Die Datei mit der Tasks-Sammlung
(setq org-default-notes-file "~/.todo-list.org")
;;(define-key global-map "C-c c" 'org-capture)
(setq org-todo-keywords '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("DOING" . "yellow")
        ("BLOCKED" . "red")
        ("REVIEW" . "orange")
        ("DONE" . "green")
        ("ARCHIVED" . "blue")))
;;(load-library "ox-reveal")
;;(require 'ox-reveal)

(set-variable 'magit-emacsclient-executable "/usr/bin/emacsclient")
