(require-package 'w3m)

;; change default browser for 'browse-url' to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;; change w3m user-agent to android
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

;;quick access hacker news
(defun w3m/hn ()
  (interactive)
  (browse-url "http://news.ycombinator.com"))

;;quick access reddit
(defun w3m/reddit (reddit)
  "Opens the REDDIT in w3m-new-session"
  (interactive (list
                (read-string "Enter the reddit (default: clojure): " nil nil "clojure" nil)))
  (browse-url (format "http://m.reddit.com/r/%s" reddit)))


(defun w3m/wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s): " term) nil nil term))))
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term)))

(defun w3m/stack-overflow-search (search-term)
  "Search for SEARCH-TERM on Stack Overflow"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Stack Overflow (%s): " term) nil nil term))))
  (browse-url
   (concat
    "http://stackoverflow.com/search?q="
    search-term)))

;;when I want to enter the web address all by hand
(defun w3m/open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address (default: google): " nil nil "www.google.com" nil)))
  (w3m-goto-url-new-session
   (concat "http://" site)))

(provide 'init-w3m)
