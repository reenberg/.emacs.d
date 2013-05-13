;; My functions
(defun ten-spaces ()
  (interactive)
  (insert "          ")
)

(defun yank-as-rectangle ()
  (interactive)
  (insert-rectangle
   (split-string (current-kill 0) "\n")
   )
  )

(defun end-of-line-and-newline ()
  (interactive)
  (end-of-line)
  (newline)
)

(defun indent-region-or-line ()
  "Ident region if mark is active"
  (interactive)
  (if mark-active
      (if (< (mark) (point))
          (indent-region (mark) (point))
          (indent-region (point) (mark))
      )
;;      (yas/expand)
      (indent-according-to-mode)
  )
)

(defun go-to-next-paren ()
  "Go to next matching parentheses"
  (interactive)
  (forward-list)
  (backward-char)
)

(defun go-to-previous-paren ()
  "Go to previous matching parentheses"
  (interactive)
  (backward-list)
  (forward-char)
)

(defun indent-whole-buffer ()
  "Ident the whole buffer, and untabify"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
)

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (if mark-active
      (if (< (mark) (point))
          (comment-or-uncomment-region (mark) (point))
          (comment-or-uncomment-region (point) (mark))
      )
      (comment-or-uncomment-region
       (line-beginning-position)
       (line-end-position)
      )
  )
)

(defun scroll-up-one ()
  "Scroll one line"
  (interactive)
  (scroll-up 1)
)

(defun scroll-down-one ()
  "Scroll one line"
  (interactive)
  (scroll-down 1)
)

(defun other-window-backward ()
  "Go to other window, backwards order"
  (interactive)
  (other-window -1)
)

(defun transpose-up ()
  "Moves line or selected text up"
  (interactive)
  (if mark-active
    (t)
    (
     (transpose-lines 1)
     (previous-line)
     (previous-line)
    )
   )
)

(defun pager-half-page-up ()
  "Moves buffer half a page, without moving point"
  (interactive)
  (pager-scroll-screen (/ (window-height) 2))
)

(defun pager-half-page-down ()
  "Moves buffer half a page, without moving point"
  (interactive)
  (pager-scroll-screen (- (/ (window-height) 2)))
)

(defun kill-region-or-line ()
  "Kills region or line, if mark is not active"
  (interactive)
  (if mark-active
      (kill-region (mark) (point))
      (kill-region
       (line-beginning-position)
       (line-beginning-position 2)
      )
  )
)

(defun kill-ring-save-region-or-line ()
  "Kills region or line, if mark is not active"
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
      (kill-ring-save
       (line-beginning-position)
       (line-beginning-position 2)
      )
  )
)

(defun move-line-or-lines (&optional n)
  (interactive)
     (when (null n)
       (setq n 1))
     (let (
           (pc (current-column))
           (deactivate-mark nil)
           )
       (if (eq transient-mark-mode 'lambda)
           (progn
             (exchange-point-and-mark)
             (let (
                   (mc (current-column))
                   (pl (line-number-at-pos (mark)))
                   (ml (line-number-at-pos (point)))
                   )
               (if (< pl ml)
                   (progn
                     (goto-line pl)
                     (beginning-of-line)
                     (set-mark-command nil)
                     (goto-line ml)
                     (end-of-line)
                     )
                 (progn
                   (goto-line ml)
                   (beginning-of-line)
                   (set-mark-command nil)
                   (goto-line pl)
                   (end-of-line)
                   )
                 )
               (forward-char 1)
               (kill-region (mark) (point))
               (next-line n)
               (beginning-of-line)
               (yank)
               (goto-line (+ ml n))
               (forward-char mc)
               (set-mark (point))
               (goto-line (+ pl n))
               (forward-char pc)

               ;; Temporarily keep the transient-mark-mode enabled
               ;; if it was disabled
               (if (eq transient-mark-mode nil)
                   (progn
                     (null transient-mark-mode)
                     (setq transient-mark-mode 'lambda)
                     )
                 )
               )
             )
         (progn
           (beginning-of-line)
           (next-line 1)
           (transpose-lines n)
           (previous-line 1)
           (forward-char pc)
           )
         )
       )
     )

(defun move-line-or-lines-one-up ()
  (interactive)
  (move-line-or-lines -1)
)


(defun move-line-or-lines-one-down ()
  (interactive)
  (move-line-or-lines 1)
)


(defun reload ()
  (interactive)
  (cond
   ((file-exists-p "~/.emacs")
    (load-file "~/.emacs"))
   ((file-exists-p "~/.emacs.d/init.el")
    (load-file "~/.emacs.d/init.el"))
  )
)
