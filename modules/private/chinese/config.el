;;; private/chinese/config.el -*- lexical-binding: t; -*-

;; (use-package! pyim
;;   :after-call after-find-file pre-command-hook
;;   :config
;;   (setq pyim-dcache-directory (concat doom-cache-dir "pyim/")
;;         pyim-page-tooltip t
;;         pyim-dcache-auto-update nil
;;         pyim-debug t
;;         default-input-method "pyim")
;;   (when (featurep! +rime)
;;     (setq pyim-default-scheme 'rime
;;           pyim-rime-limit 100
;;           pyim-title "ㄓ")))

(use-package! liberime-config
  :defer 1
  :init
  (setq liberime-user-data-dir (expand-file-name "local/pyim/rime" doom-private-dir))

  (add-hook 'liberime-after-start-hook
            (lambda ()
              (liberime-select-schema "guhuwubi")))
  ; :config
  ; (liberime-load)
  ;; (setq default-input-method "erime"

  ;;       ;; erime-prompt-tooltip 'posframe
  ;;       ;; erime-prompt-tooltip 'minibuffer
  ;;       )
  )

(use-package! rime
  :defer 1
  :after liberime-config
  :config
  (setq default-input-method "rime"
          ;; rime-show-candidate 'overlay
          ;; rime-show-candidate 'posframe
          ;; rime-show-candidate 'minibuffer
          rime-show-candidate 'popup
          )
  )

;; (use-package! pangu-spacing
;;   :hook (text-mode . pangu-spacing-mode)
;;   :config
;;   ;; Always insert `real' space in org-mode.
;;   (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))


;; (use-package! fcitx
;;   :after evil
;;   :config
;;   (when (executable-find "fcitx-remote")
;;     (fcitx-evil-turn-on)))


;; (use-package! ace-pinyin
;;   :after avy
;;   :init (setq ace-pinyin-use-avy t)
;;   :config (ace-pinyin-global-mode t))


;;
;;; Hacks

(defadvice! +chinese--org-html-paragraph-a (args)
  "Join consecutive Chinese lines into a single long line without unwanted space
when exporting org-mode to html."
  :filter-args #'org-html-paragraph
  (cl-destructuring-bind (paragraph contents info) args
    (let* ((fix-regexp "[[:multibyte:]]")
           (origin-contents
            (replace-regexp-in-string
             "<[Bb][Rr] */>"
             ""
             contents))
           (fixed-contents
            (replace-regexp-in-string
             (concat "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)")
             "\\1\\2"
             origin-contents)))
      (list paragraph fixed-contents info))))
