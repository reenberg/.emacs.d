;; Aktiver sml-mode
;(require 'sml-mode) ;; commented as new emacs complains.
(setq auto-mode-alist (cons '("\\.sml$" . sml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sig$" . sml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.lex$" . sml-lex-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yacc$" . sml-yacc-mode) auto-mode-alist))
(add-hook 'sml-mode-hook
          (lambda() ;;; *** SML-mode Customisation
            (flyspell-prog-mode)
            (flyspell-buffer)
            ;; (setq sml-program-name "mosml")
            ;; (setq sml-default-arg "-P full")
            (setq sml-program-name "sml")
            (highlight-beyond-fill-column) ; Subtil markering af lange linjer bruger
                                                  ; default-fill-column som længde
            (highlight-current-line-minor-mode) ; Marker nuværende linje
            (setq sml-indent-level 2)        ; conserve on horizontal space
            (setq words-include-escape t)    ; \ loses word break status
            (setq indent-tabs-mode nil)))    ; never ever indent with tabs
