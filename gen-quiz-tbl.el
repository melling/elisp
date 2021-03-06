(defun quote-strings (b e)
  "add 1 to every 2 digit number in the region"  
  (interactive "r")  
  (goto-char b) 
  (while (re-search-forward "\\b\|[A-Z]\\b" e t) 
   (replace-match (number-to-string
		   (concat '\"' ((match-string 0)))))))
(defun find-it ()
  (interactive)
  (goto-char 0)
  (while (re-search-forward "\|[A-Z]")
    (replace-match (concat "\"" (match-string 0))))
  (goto-char 0)
  (while (re-search-forward "[a-z]\|")
    (replace-match (concat (match-string 0) "\"" )))
)

(defun replace-trailing-pipe ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "[A-Z\?\.]\|" (point-max) t)
    (replace-match (concat (substring (match-string 0) 0 1) "\"," )))
)

(defun replace-leading-pipe ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward ",[A-Z\?\.]" (point-max) t)
    (replace-match (concat ",\"" (substring (match-string 0) 1 2) )))
)

(defun replace-numbers ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\|[0-9]" (point-max) t)
    (replace-match (concat "," (substring (match-string 0) 1 2) )))
)

(defun replace-double-pipe ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\|\|" (point-max) t)
    (replace-match "\",\"\",\""))
)

(defun quote-line-start ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "\"" )
    (forward-line)))

(defun make-insert-quiz-state-flowers-row ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "insert into quiz values(null,\"US Capitals\",\"State Flowers\",\"\",")
    (goto-char (line-end-position))
    (insert ",1);")
    (forward-line))
)

(defun make-insert-quiz-state-nicknames-row ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "insert into quiz values(null,\"US Capitals\",\"State Nicknames\",\"\",")
    (goto-char (line-end-position))
    (insert ",1);")
    (forward-line))
)

(defun make-insert-quiz-trivia-row ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "insert into quiz values(null,\"Trivia Master\",")
    (goto-char (line-end-position))
    (insert ",1);")
    (forward-line))
)

(defun make-insert-quiz-english-row ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "insert into quiz values(null,\"Word Tutor\",")
    (goto-char (line-end-position))
    (insert ",1);")
    (forward-line))
)

(defun make-insert-quiz-russian-row ()
  (interactive)  
  (goto-char (point-min))
  (while (not (eobp))
    (insert "insert into quiz values(null,\"Russian\",")
    (goto-char (line-end-position))
    (insert ",1);")
    (forward-line))
)

(defun gen-quiz-state-flowers-tbl ()
  (interactive)
  (replace-trailing-pipe)
  (replace-leading-pipe)
  (replace-numbers)
  (quote-line-start)
  (make-insert-quiz-state-flowers-row)
)

(defun gen-quiz-state-nicknames-tbl ()
  (interactive)
  (replace-trailing-pipe)
  (replace-leading-pipe)
  (replace-numbers)
  (quote-line-start)
  (make-insert-quiz-state-nicknames-row)
)

(defun gen-quiz-trivia-tbl ()
  (interactive)
  (replace-trailing-pipe)
  (replace-leading-pipe)
  (replace-numbers)
  (quote-line-start)
  (make-insert-quiz-trivia-row)
)

(defun gen-quiz-english-tbl ()
  (interactive)
  (replace-trailing-pipe)
  (replace-leading-pipe)
  (replace-numbers)
  (replace-double-pipe)
  (quote-line-start)
  (make-insert-quiz-english-row)
)

(defun gen-quiz-russian-tbl ()
  (interactive)
  (replace-trailing-pipe)
  (replace-leading-pipe)
  (replace-numbers)
  (replace-double-pipe)
  (quote-line-start)
  (make-insert-quiz-russian-row)
)

;;(substring "o"|" 1 2)
