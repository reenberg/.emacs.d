;; Aktiverer AUCTeX.
;(require 'tex-site)
(setq auto-mode-alist (cons '("\\.tex$" . LaTeX-mode) auto-mode-alist))
(add-hook 'LaTeX-mode-hook
	  (lambda() ;;; *** AUCTeX Customisation
        (print "AUCTex mode hook")
	    (LaTeX-install-toolbar) ;; AUCTeX has this bad-ass toolbar as well.
	    (LaTeX-math-mode t)
	    (reftex-mode t)
	    (tex-pdf-mode t)
        (setq-default TeX-master nil) ;; Query for master file.
	    (auto-fill-mode t)
	    (flyspell-mode t)
        (filladapt-mode nil) ;; Dont enable filladapt mode for tex it screws
                             ;; up somtime.
	    (setq TeX-auto-save t)  ;; Enable parse on save, for
                                ;; language specific constructs, ie
                                ;; dk-hook
	    (setq TeX-parse-self t) ;; Enable parse on load, for
                                ;; language specific constructs, ie
                                ;; dk-hook
        (setq reftex-fref-is-default t) ;; deprecated
        ;;(setq reftex-ref-style-default-list ("Fancyref")) ;; Why doesn't this work?
        ;; Add Okular as a viewer.
        (setq TeX-view-program-list
              '(("Okular"
                 ("okular --unique %o"
                  (mode-io-correlate "#src:%n%b")))))
        (print TeX-view-program-list)
        ;; Set the default viewer
        (setq TeX-view-program-selection '((output-pdf "Okular")))
        (print TeX-view-program-selection)

            ;; Only run flyspell-buffer if the file is a true .tex file. This is so
            ;; flyspell-buffer aren't run when opening the .log file and the *TeX Help* buffer.
            ;; equalp is not case sensitive.
	    (if (equal (substring (buffer-file-name (current-buffer)) -4 nil) ".tex")
                (flyspell-buffer))))

;; When AUCTeX has parsed the document and found \usepackage[danish]{babel} this langugage
;; hook is run. Only works when TeX-parse-self and TeX-auto-save is set.
(add-hook 'TeX-language-dk-hook
	  (function (lambda () (ispell-change-dictionary "dansk"))))

;; Add the webpage entry to the bibtex mode when editing .bib files.
;; The bibliography style must be a urlbst compliant one:
;; http://www.tex.ac.uk/tex-archive/biblio/bibtex/contrib/urlbst/
(defun my-bibtex-hook ()
  (setq bibtex-mode-user-optional-fields '("location" "issn")) ; e.g.
  (setq bibtex-BibTeX-entry-alist
        (cons
         '("Webpage" "A webpage with a lastchecked date"
           ; REQUIRED fields
           (("url" "The URL of the page")
            ("title" "The title of the resource")
            ("lastchecked" "Date when you last verified the page was there"))
           ; CROSSREF (optional if crossref field is present, else required).
           (())
           ; OPTIONAL
           (("author" "The author of the webpage")
            ("editor" "The editor/maintainer of the webpage")
            ("year" "Year of publication of the page")
            ("month" "Month of publication of the page")
            ("note" "Remarks to be put at the end of the entry")))
         bibtex-BibTeX-entry-alist)))
(add-hook 'bibtex-mode-hook 'my-bibtex-hook)
