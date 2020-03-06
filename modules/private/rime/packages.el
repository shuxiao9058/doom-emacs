;; -*- no-byte-compile: t; -*-
;;; private/rime/packages.el

;; (package! pyim :recipe (:local-repo "~/workspace/pyim"))

;; (when (featurep! +rime)
;;   (package! liberime-config
;;     :recipe (
;;              :host github
;;              :repo "shuxiao9058/liberime"
;;              :branch "feature/add_schema_config"
;;              :files ("liberime-config.el" "src" "CMakeLists.txt" "Makefile"))))

;; (package! fcitx :pin "12dc2638dd")
;; (package! ace-pinyin :pin "8b2e9335b0")
;; (package! pangu-spacing :pin "f92898949b")


(package! liberime
  :recipe (
           ;; :local-repo "~/workspace/liberime"
           :host github
           ; :repo "DogLooksGood/liberime"
           :repo "merrickluo/liberime"
           ;; :repo "QiangF/liberime"
           ;; :repo "shuxiao9058/liberime"
           ;; :branch "feature/add_schema_config"
           :files ("liberime.el" "src" "CMakeLists.txt" "Makefile")))

(package! rime
  :recipe (
           ;; :host github
           ;; :repo "DogLooksGood/emacs-rime"
           :local-repo "~/workspace/emacs-rime"
           ;; :repo "shuxiao9058/emacs-rime"
           :files ("rime.el")
           ))
