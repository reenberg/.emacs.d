(add-hook 'ido-setup-hook 'ido-my-keys)

;; Keybindings when ido-mode is active and trying to complete stuff
(defun ido-my-keys ()
  "Add my keybindings for ido"
  (define-key ido-completion-map [(control tab)] 'ido-next-match)
  (define-key ido-completion-map "\C-b" 'ido-next-match)
  (define-key ido-completion-map [tab] 'ido-complete)
)

;; Keybinding to force activation ido niceness
(global-set-key [(control tab)] 'ido-switch-buffer)
(global-set-key "\C-b" 'ido-switch-buffer)


;; My keybindings
(global-set-key [(control shift up)] 'move-line-or-lines-one-up)
(global-set-key [(control shift down)] 'move-line-or-lines-one-down)
;(global-set-key [(meta return)] 'hippie-expand)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-q" 'comment-or-uncomment-region-or-line)
(global-set-key "\C-\M-o" 'other-window-backward)
(global-set-key [(shift up)] 'pager-half-page-down)
(global-set-key [(shift down)] 'pager-half-page-up)
(global-set-key [(meta up)] 'scroll-down-one)
(global-set-key [(meta down)] 'scroll-up-one)
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control return)] 'end-of-line-and-newline)
(global-set-key [(shift return)] 'flyspell-auto-correct-word)
(global-set-key [(control shift a)] 'align-all-strings)
(global-set-key [(control shift y)] 'yank-as-rectangle)

(global-set-key [(control w)] 'clipboard-kill-region)
(global-set-key [(meta w)] 'clipboard-kill-ring-save)
(global-set-key [(control y)] 'clipboard-yank)

;(global-set-key [(control meta y)] 'boxquote-yank)
;(global-set-key (kbd "M-S-SPC") 'ten-spaces)
;(global-set-key (kbd "C-x C-a") 'anything)
;(global-set-key [(control w)] 'kill-region-or-line)
;(global-set-key [(meta w)] 'kill-ring-save-region-or-line)
(put 'set-goal-column 'disabled nil)
