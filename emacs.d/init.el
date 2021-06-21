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
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
   '("aba75724c5d4d0ec0de949694bce5ce6416c132bb031d4e7ac1c4f2dbdd3d580" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "d7ee1fdb09a671a968b2a751746e5b3f5f26ac1fd475d95d094ee1e4ce446d58" "4f1d2476c290eaa5d9ab9d13b60f2c0f1c8fa7703596fa91b235db7f99a9441b" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "9f9fc38446c384a4e909b7220d15bf0c152849ef42f5b1b97356448612c77953" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "1f50a7274cd56f28713e1694600ec7b8f2fd1c7d2ef38c5e7378a26931605409" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "26e07f80888647204145085c4fed78e0e6652901b62a25de2b8372d71de9c0a1" "22a514f7051c7eac7f07112a217772f704531b136f00e2ccfaa2e2a456558d39" "0b3aee906629ac7c3bd994914bf252cf92f7a8b0baa6d94cb4dfacbd4068391d" "6e14157d0c8857e81035e6c7131dc17e4115b3911c82a1fd32e528aec8e89eab" "e6a2832325900ae153fd88db2111afac2e20e85278368f76f36da1f4d5a8151e" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "1a52e224f2e09af1084db19333eb817c23bceab5e742bf93caacbfea5de6b4f6" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "52498cb107fb252e92ac35b8a5eba466fede7f03bebcf50412190c452ed7329e" "89885317e7136d4e86fb842605d47d8329320f0326b62efa236e63ed4be23c58" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "a1d906942ff0776ce2dd72cd731126a35dc3d3140a765a0bb5a1a1b6a16c6b45" "859ff6182156e4bea960c2c7678f8b3da23961046b855e805f0f5a5d09b92658" "db7f422324a763cfdea47abf0f931461d1493f2ecf8b42be87bbbbbabf287bfe" "fc5a808a86b392ffdb5c638c4942db86ba66b847b1792f100f681405606bffef" "63f043db62adbfd5e7e670ca15ac5b5bc25abec41d34e30984243f2d938c3391" "3d6e0d2233254368278ea49f5c4e957787a4a48287ab38a8ff725de9bbb53a37" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(exwm-floating-border-color "#0b0e11")
 '(fci-rule-color "#605a52")
 '(helm-minibuffer-history-key "M-p")
 '(highlight-tail-colors ((("#283637") . 0) (("#25373e") . 20)))
 '(hl-sexp-background-color "#efebe9")
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
 '(jdee-db-active-breakpoint-face-colors (cons "#10151C" "#5EC4FF"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#10151C" "#8BD49C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#10151C" "#41505E"))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#D95468")
 '(org-agenda-files nil)
 '(package-selected-packages
   '(leuven-theme material-theme zenburn-theme weyland-yutani-theme paper-theme underwater-theme helm-ag all-the-icons wgrep-helm wgrep scala-mode company yaml-mode typescript-mode multi-term dashboard world-time-mode org-download htmlize org-plus-contrib tj3-mode spacemacs-theme origami web-mode use-package org-jira neotree json-mode js2-mode js-react-redux-yasnippets helm-projectile helm-lsp flycheck exec-path-from-shell evil-surround evil-magit evil-commentary evil-collection emmet-mode elisp-format dumb-jump autopair all-the-icons-ivy all-the-icons-dired add-node-modules-path))
 '(pdf-view-midnight-colors '("#5f5f87" . "#ffffff"))
 '(rustic-ansi-faces
   ["#1D252C" "#D95468" "#8BD49C" "#EBBF83" "#5EC4FF" "#E27E8D" "#70E1E8" "#A0B3C5"])
 '(vc-annotate-background "#f7f3ee")
 '(vc-annotate-color-map
   (list
    (cons 20 "#81895d")
    (cons 40 "#87855d")
    (cons 60 "#8e825e")
    (cons 80 "#957f5f")
    (cons 100 "#957f5f")
    (cons 120 "#957f5f")
    (cons 140 "#957f5f")
    (cons 160 "#977b73")
    (cons 180 "#997787")
    (cons 200 "#9c739c")
    (cons 220 "#996c87")
    (cons 240 "#976573")
    (cons 260 "#955f5f")
    (cons 280 "#9e716b")
    (cons 300 "#a78378")
    (cons 320 "#b09685")
    (cons 340 "#605a52")
    (cons 360 "#605a52")))
 '(vc-annotate-very-old-color nil))
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

