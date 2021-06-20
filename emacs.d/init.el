(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;install packages by default
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(org-babel-load-file (expand-file-name "boot.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
   '("fc5a808a86b392ffdb5c638c4942db86ba66b847b1792f100f681405606bffef" "63f043db62adbfd5e7e670ca15ac5b5bc25abec41d34e30984243f2d938c3391" "3d6e0d2233254368278ea49f5c4e957787a4a48287ab38a8ff725de9bbb53a37" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(helm-minibuffer-history-key "M-p")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70008")
     ("FAIL" . "#d70008")
     ("DONE" . "#00af00")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(all-the-icons wgrep-helm wgrep scala-mode company yaml-mode typescript-mode multi-term dashboard world-time-mode org-download htmlize org-plus-contrib tj3-mode spacemacs-theme origami web-mode use-package org-jira neotree json-mode js2-mode js-react-redux-yasnippets helm-projectile helm-lsp helm-ag flycheck exec-path-from-shell evil-surround evil-magit evil-commentary evil-collection emmet-mode elisp-format dumb-jump autopair all-the-icons-ivy all-the-icons-dired add-node-modules-path))
 '(pdf-view-midnight-colors '("#5f5f87" . "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-menu-bookmark ((t (:foreground "color-33" :weight bold))))
 '(bookmark-menu-heading ((t (:inherit font-lock-type-face :foreground "color-33"))))
 '(buffer-menu-buffer ((t (:foreground "color-33" :weight bold))))
 '(cursor ((t (:background "color-33" :foreground "white"))))
 '(dashboard-heading ((t (:inherit font-lock-keyword-face :foreground "color-33"))))
 '(dashboard-text-banner ((t (:inherit font-lock-keyword-face :foreground "color-33" :weight bold))))
 '(evil-ex-lazy-highlight ((t (:background "brightmagenta" :foreground "white"))))
 '(flycheck-error ((t (:background "color-220" :underline (:color "black" :style wave)))))
 '(helm-bookmark-file ((t (:foreground "color-33"))))
 '(helm-buffer-directory ((t (:background "#ffffff" :foreground "color-33"))))
 '(helm-buffer-file ((t (:background "#ffffff" :foreground "color-33"))))
 '(info-menu-header ((t (:foreground "color-33" :underline t :weight bold))))
 '(org-column ((t (:background "white"))))
 '(org-level-1 ((t (:inherit bold :foreground "color-33" :weight bold :height 1.3))))
 '(org-level-2 ((t (:inherit bold :foreground "color-33" :weight bold :height 1.2))))
 '(org-level-3 ((t (:foreground "blue" :weight normal :height 1.1))))
 '(org-level-4 ((t (:foreground "color-243" :weight normal))))
 '(org-meta-line ((t (:foreground "color-244"))))
 '(org-tag ((t (:foreground "color-75"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "color-247")))))

