;; Visual bookmark "mode"


;; Highlighting styles

;(setq bm-highlight-style 'bm-highlight-only-line) ;;default, the last one in the pic
;(setq bm-highlight-style 'bm-highlight-line-and-fringe) ;; the first one
(setq bm-highlight-style 'bm-highlight-only-fringe) ;;middle bookmark


;; Keybindings

;M$ Visual Studio style bindings.
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)
