;; -*- no-byte-compile: t; -*-
;;; private/chinese/packages.el

(package! pyim :recipe (:local-repo "~/workspace/pyim"))

(when (featurep! +rime)
  (package! liberime-config
    :pin "282d37c44b"
    :recipe (
        :local-repo "~/workspace/liberime"
         :files ("liberime-config.el" "src" "CMakeLists.txt" "Makefile")
                   )))

(package! fcitx :pin "12dc2638dd")
(package! ace-pinyin :pin "8b2e9335b0")
(package! pangu-spacing :pin "f92898949b")