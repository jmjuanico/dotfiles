;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh) 
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version) t (if (or (assoc package package-archive-contents) 
							  no-refresh) 
						      (package-install package) 
						    (progn (package-refresh-contents) 
							   (require-package package min-version
									    t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search evil-want-C-u-scroll t evil-want-C-w-in-emacs-state t)

;; specific only to evil-collection configuration
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(require 'evil)
(when 
    (require 'evil-collection nil t) 
  (evil-collection-init))

(require 'evil-commentary)
(require 'evil-surround)
(evil-mode t)
(evil-commentary-mode t)
(global-evil-surround-mode t)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(require 'all-the-icons)
(require 'helm)
(require 'helm-mode)
(require 'helm-config)
(require 'elisp-format)
(require 'autopair)
(require 'emmet-mode)

(autopair-global-mode)
(setq helm-ag-insert-at-point 'symbol)
(setq emmet-expand-jsx-className? t) ;; default nil

(define-key evil-normal-state-map (kbd "C-i") 'eslint-fix)
(define-key evil-normal-state-map (kbd ",,") 'emmet-expand-line)
(define-key evil-normal-state-map (kbd "C-f l") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd "C-f m") 'helm-M-x)
(define-key evil-normal-state-map (kbd "C-f k") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "C-f b") 'helm-bookmarks)
(define-key evil-normal-state-map (kbd "C-f s") 'helm-projectile-ag)
(define-key evil-normal-state-map (kbd "C-f f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "C-f p") 'helm-projectile)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "gd") 'dumb-jump-go)
(define-key evil-normal-state-map (kbd "gb") 'dumb-jump-back)
(define-key evil-normal-state-map (kbd "ge") 'dumb-jump-go-prefer-external)

;; making sure tab completion works
(with-eval-after-load 'helm (define-key helm-find-files-map (kbd "TAB")
			      'helm-execute-persistent-action))
(defadvice helm-projectile-find-file (after helm-projectile-find-file activate) 
  (neotree-dir default-directory))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jump to files and folders
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dumb-jump 
  :ensure t 
  :bind (("M-g o" . dumb-jump-go-other-window) 
	 ("M-g j" . dumb-jump-go) 
	 ("M-g b" . dumb-jump-back) 
	 ("M-g q" . dumb-jump-quick-look) 
	 ("M-g x" . dumb-jump-go-prefer-external) 
	 ("M-g z" . dumb-jump-go-prefer-external-other-window)) 
  :config (setq dumb-jump-selector 'helm)
  (setq dumb-jump-force-searcher 'ag))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup Linter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))

;; Setup Mac only
(when (memq window-system '(mac ns)) 
  (exec-path-from-shell-initialize))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules () 
  (let* ((root (locate-dominating-file (or (buffer-file-name) 
					   default-directory) "node_modules")) 
	 (eslint (and root 
		      (expand-file-name "node_modules/eslint/bin/eslint.js" root)))) 
    (when (and eslint 
	       (file-executable-p eslint)) 
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate) 
  (if (equal web-mode-content-type "jsx") 
      (let ((web-mode-enable-part-face nil)) ad-do-it) ad-do-it))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHOW LINT ERRORS IF ANY ON BUFFER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun flycheck-list-errors-only-when-errors () 
  (if flycheck-current-errors (flycheck-list-errors) 
    (-when-let (buffer (get-buffer flycheck-error-list-buffer)) 
      (dolist (window (get-buffer-window-list buffer)) 
	(quit-window nil window)))))
(add-hook 'flycheck-after-syntax-check-hook #'flycheck-list-errors-only-when-errors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIX LINT: M-x eslint-fix
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     (eval-after-load 'js-mode
;;       '(add-hook 'js-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))
;;
;;     (eval-after-load 'js2-mode
;;       '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

(defgroup eslint-fix nil 
  "Fix JavaScript linting issues with ‘eslint-fix’." 
  :link '(function-link eslint-fix) 
  :tag "ESLint Fix" 
  :group 'tools)

(defcustom eslint-fix-options nil 
  "Additional options to pass to ESLint (e.g. “--quiet”)." 
  :tag "ESLint Options" 
  :type '(repeat string))

;;;###autoload
(defun eslint-fix () 
  "Format the current file with ESLint." 
  (interactive) 
  (unless buffer-file-name 
    (error 
     "ESLint requires a file-visiting buffer")) 
  (when (buffer-modified-p) 
    (if (y-or-n-p (format "Save file %s? " buffer-file-name)) 
	(save-buffer) 
      (error 
       "ESLint may only be run on an unmodified buffer"))) 
  (let* ((root (locate-dominating-file (or (buffer-file-name) 
					   default-directory) "node_modules")) 
	 (eslint (and root 
		      (expand-file-name "node_modules/eslint/bin/eslint.js" root)))) 
    (when (and eslint 
	       (file-executable-p eslint)) 
      (setq-local options (append eslint-fix-options (list "--fix" buffer-file-name))) 
      (apply #'call-process eslint nil "*ESLint Errors*" nil options) 
      (revert-buffer t t t) 
      (flycheck-buffer))))

(provide 'eslint-fix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (adwaita)))
 '(package-selected-packages
   (quote
    (emmet-mode helm-ag autopair dumb-jump elisp-format exec-path-from-shell web-mode flycheck json-mode evil-collection use-package js2-mode undo-tree evil-commentary evil-surround all-the-icons-dired all-the-icons-ivy all-the-icons helm-projectile helm-lsp lsp-mode helm js-react-redux-yasnippets evil-magit add-node-modules-path neotree evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set bookmarklist as default for emac
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
