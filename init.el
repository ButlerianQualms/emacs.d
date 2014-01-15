
;; CouchDB support

(add-to-list 'load-path "~/.emacs.d/plugins/couchdb")

(require 'tramp)
  (when (featurep 'couchdb-document)
    (couchdb-document-register-file-name-handler))
(require 'couchdb-document-text)



;; loading interface defaults ASAP
(load (concat user-emacs-directory "interface.el"))

;; loading package.el ASAP to avoid errors
(require 'package)
;; (package-initialize)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
 (package-initialize)
(setq package-archive-enable-alist '(("melpa" deft magit)))

;; Initialize el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(setq el-get-user-package-directory "~/.emacs.d/el-get-user/init/")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes/")
(setq my-packages
      (append
       '(el-get ag
		;;        apache-mode
		;;autotest
                bundler
                coffee-mode
                gist
                ;;        git-modes
                ;;go-mode
		;;        haml-mode
		;;        idle-highlight-mode
		ido-ubiquitous
		;;        inf-ruby
		;;        lua-mode
                magit
                markdown-mode
                paredit
		php-mode
                powerline
                ;;rspec-mode
                ;;ruby-compilation
		;;rvm
		        sass-mode
		;;        scala-mode2
		;;        slime
		;;        smartparens
		;;        smarty-mode
		smex
		;;       tidy
		       web-mode
                yaml-mode
		        yasnippet
		;;zenburn-theme
        auto-complete
        js2-mode
        expand-region
        solarized-theme
        auto-complete
        emmet-mode
        ac-emmet
        ac-coffee
        autopair
        highlight-parentheses
        auto-complete-nxml
        ;;ox-reveal
		)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

;;
;; post el-get configuration
;;

;; function definitions
(load (concat user-emacs-directory "functions.el"))

;; load other emacs defaults
(load (concat user-emacs-directory "defaults.el"))

;; language hooks
(load (concat user-emacs-directory "languages.el"))

;; load system-tailored defaults you should probably edit this
(load (concat user-emacs-directory "system.el"))

;; emacs server goodness
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
