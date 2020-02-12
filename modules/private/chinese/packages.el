;; -*- no-byte-compile: t; -*-
;;; private/chinese/packages.el

(package! pyim :pin "bbeb68605e")

(if (featurep! +rime)
    (package! liberime-config
      :recipe (:host github
                        :repo "xhcoding/liberime"
                        :files ("liberime-config.el" "src" "CMakeLists.txt" "Makefile"))))

(package! fcitx :pin "12dc2638dd")
(package! ace-pinyin :pin "8b2e9335b0")
(package! pangu-spacing :pin "f92898949b")
(package! pyim :pin "bbeb68605e")
