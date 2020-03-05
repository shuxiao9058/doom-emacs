;;; private/tabs/config.el -*- lexical-binding: t; -*-

(use-package! awesome-tab
  :after-call after-find-file dired-initial-position-hook
  :commands (awesome-tab-build-ivy-source awesome-tab-select-visible-tab awesome-tab-mode)
  :init
  (setq awesometab-hide-tabs-hooks
        '(magit-status-mode-hook magit-popup-mode-hook reb-mode-hook helpful-mode-hook))
  (setq awesome-tab-style 'alternate)
  ;; Make hydra compatible with awesome-tab
  (with-eval-after-load 'hydra
    (defun zenith/lv-window (fun)
      (with-selected-window (funcall fun)
        (setq-local header-line-format nil))
      lv-wnd)

    (advice-add 'lv-window :around 'zenith/lv-window))
  (dotimes (i 10)
    (general-define-key (concat "M-" (int-to-string i)) #'awesome-tab-select-visible-tab))
  :config
  (awesome-tab-mode +1)
  )
