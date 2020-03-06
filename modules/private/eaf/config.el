;;; private/eaf/config.el -*- lexical-binding: t; -*-

(use-package! eaf
  :load-path "~/workspace/emacs-application-framework"
  ;; :when IS-LINUX
  ;; :load-path "/home/xhcoding/Code/ELisp/emacs-application-framework/"
  :config
  (evil-set-initial-state 'eaf-mode 'emacs)
  (require 'seq)
  (setq process-environment (seq-filter
                             (lambda(var)
                               (and (not (string-match-p "QT_SCALE_FACTOR" var))
                                    (not (string-match-p "QT_SCREEN_SCALE_FACTOR" var)))) process-environment))

  (eaf-setq eaf-browser-default-zoom  "2")
  (set-popup-rule! "^\\*color" :size 0.5))
