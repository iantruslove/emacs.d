(ignore-errors
  (require-package 'erlang)
  (require-package 'alchemist))

(when (package-installed-p 'erlang)
  (require 'erlang-start))

(when (package-installed-p 'alchemist)
  (setq alchemist-buffer-status-modeline nil))

(provide 'init-erlang)
