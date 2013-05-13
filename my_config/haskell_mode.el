;; Inferioer-haskell mode
;; Do not change directory to ~/.cabal on load
(setq inferior-haskell-find-project-root nil)
(add-hook 'haskell-mode-hook
          (lambda() ;;; *** haskell-mode Customisation
            (flyspell-prog-mode)
            (flyspell-buffer)
            ;; Show documentation/types in minibuffer
            (turn-on-haskell-doc-mode)
            ;; Use haskell-indentation. Doesn't seem to be auto enabled anymore?
            (turn-on-haskell-indentation)))
