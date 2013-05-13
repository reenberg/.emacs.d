;;
(add-hook 'org-mode-hook
	  (lambda() ;;; *** org-mode Customization
            (setq htmlize-output-type 'inline-css)
            (setq org-export-html-validation-link "")
            (flyspell-mode t)
            (flyspell-buffer)
            ))
