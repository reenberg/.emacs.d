
(setq auto-mode-alist
        (append '(("\\.ml[ily]?$" . tuareg-mode)
	          ("\\.topml$" . tuareg-mode))
                  auto-mode-alist))

(add-hook 'tuareg-mode-hook
          (lambda() ;;; *** tuareg Customisation
            (print "tuareg mode hook")
            (highlight-beyond-fill-column)      ; Subtil markering af lange linjer bruger
                                                ; default-fill-column som længde
            (highlight-current-line-minor-mode) ; Marker nuværende linje
            (setq indent-tabs-mode nil)))
