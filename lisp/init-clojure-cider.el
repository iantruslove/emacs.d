(require 'init-clojure)
(require-package 'emacs '(24))

(require-package 'cider)
(require-package 'ac-nrepl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nrepl with Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq nrepl-popup-stacktraces nil)

(after-load 'cider
  (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
  (add-hook 'cider-mode-hook 'ac-nrepl-setup)
  (after-load 'auto-complete
    (add-to-list 'ac-modes 'cider-repl-mode))

  (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
  (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
  (define-key cider-mode-map (kbd "C-c z") 'cider-switch-to-relevant-repl-buffer)


  ;; nrepl isn't based on comint
  (add-hook 'cider-repl-mode-hook
            (lambda () (setq show-trailing-whitespace nil)))

  (add-hook 'cider-mode-hook
            (lambda ()
              (define-key cider-mode-map (kbd "C-c t") 'cider-test-show-report)
              (define-key cider-mode-map (kbd "C-c C-t") 'clojure-jump-between-tests-and-code))))

(let ((sonian-stuff "~/projects/sa-safe/.elisp/sonian.el"))
  (when (file-exists-p sonian-stuff)
    (message "Loading Sonian extras...")
    (load (expand-file-name sonian-stuff))
    (require 'sonian)
    ;; Turn on whitespace mode all
    ;; the time
    (add-hook 'clojure-mode-hook 'whitespace-mode)
    (require 'cider-test)
    (setq cider-test-infer-test-ns 'cider-test-sonian-test-ns-fn)))


(provide 'init-clojure-cider)
