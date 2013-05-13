;; Set font
(set-frame-font "Liberation Mono-10")

;; Set the default dictionary to british.
(setq-default ispell-local-dictionary "british")

(toggle-truncate-lines nil)

;; Display time in mode line
(display-time)
;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)


;; Default major mode is Text Mode
(setq default-major-mode 'text-mode)
;; Enable filladapt mode. Nice for textmode
(require 'filladapt)
(add-hook 'text-mode-hook 'filladapt-mode)
;; Turn on Auto Fill Mode along with Text Mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)


;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)


;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)


;; Don't fucking beep!!! It's much more plesant to see a flashing background.
(setq visible-bell t)


;; Det vises hvilke paranteser der hÃ¸rer sammen (vises med en farve).
(show-paren-mode t)


;; Angiver hvor lange linjer må være (i tegn) foer Emacs wrapper dem. Man kan
;; frit Ã¦ndre tallet som man har lyst.
(setq default-fill-column 80)

;; I stedet for at skulle skrive 'yes' og 'no', kan man nÃ¸jes med 'y' og 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Stop bloating up my folders and save temporary files elseware, than the
;; original files folder.
(setq backup-directory-alist `((".*" .
                                ,(expand-file-name "backup" emacs-file-dir)))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.
;; Save sessions elsewhere
(desktop-change-dir emacs-file-dir)
;; Enable backup files
(setq make-backup-files t)
;; Keep autosave list here
(setq auto-save-list-file-prefix
      (expand-file-name "auto-save-list/.saves-" emacs-file-dir))


;; last lines should end in a carriage return
(setq require-final-newline t)


;; spaces instead of tabs by default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; Show the trailing whitespaces.
(setq-default show-trailing-whitespace t)
;; Remove trailing white space before we save the file.
(add-hook 'before-save-hook
          (lambda()
            (delete-trailing-whitespace)))
;; Add nice message about removing of trailing white space.
(add-hook 'after-save-hook
          (lambda()
            (message (concat "Wrote "
                             (buffer-file-name)
                             " and removed trailing white space"))))



;; When opening pdf/dvi/images/.. in DocView, then use auto revert mode so it
;; don't reload the entire file and setting the current page to page 1, but
;; actually just update the current page with the new content.
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
