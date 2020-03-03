;;; private/wakatime/config.el -*- lexical-binding: t; -*-

(use-package! wakatime-mode
  :after-call pre-command-hook
  :init (setq +wakatime-hide-filenames t)
  :hook ((org-mode . wakatime-mode)
         (prog-mode . wakatime-mode))
  :custom ((wakatime-cli-path "/usr/local/bin/wakatime")
           (wakatime-python-bin "/usr/local/anaconda3/bin/python3"))
  :config
  (global-wakatime-mode t)

  ;; dirty fix on linux to use the 'cli.py' script instead of 'wakatime'
  (if (string-equal system-type "gnu/linux")
      (setq wakatime-python-path "/usr/bin/python3.6"))
  )
