;; Basic clojure support, even in Emacs 23
;; See also init-clojure-cider.el

(require-package 'subshell-proc)
(require 'clojurescript-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc clojurescript tweaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after-load 'clojurescript-mode
  (add-hook 'clojurescript-mode-hook
            (lambda ()
              (define-key clojurescript-mode-map (kbd "C-c z") 'clojurescript-switch-to-lisp)
              )))



(add-auto-mode 'clojurescript-mode "\\.cljs\\'")

(provide 'init-clojurescript)
