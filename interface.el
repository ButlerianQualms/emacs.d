;; Hide all GUI stuff. Emacs is no GUI!
(defun intinig-no-gui ()
  "Turns off extra-gui stuff"
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))

(intinig-no-gui)
(add-hook 'before-make-frame-hook 'intinig-no-gui)

;; sets the default font to menlo
;;(defun fontify-frame (frame)
;;  (set-frame-parameter frame 'font "Menlo Regular-12"))
;;(fontify-frame nil)
;;(push 'fontify-frame after-make-frame-functions)

;; default window size
(setq default-frame-alist '((width . 190) (height . 50) ))

;; no "no strange gnu guy"
;;(setq inhibit-startup-message t)

;; Übernommen von https://sites.google.com/site/steveyegge2/effective-emacs

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;den M-x Dialog mit folgenden Kombinationen
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;;C-h als backspace
(keyboard-translate ?\C-h ?\C-?)

;;(global-set-key (kbd "C-b") 'forward-char)

;;(global-set-key (kbd "C-f") 'backward-char)
