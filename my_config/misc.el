;; Set font
(set-frame-font "Dejavu Sans Mono-10")

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

;; If the shell is using colours, then enable this,
;; else it will print the color "codes".
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)


;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)


;; Don't fucking beep!!! It's much more plesant to see a flashing background.
(setq visible-bell t)

;; Show opposite paren
(show-paren-mode t)


;; Default line length, used for word wrapping.
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



(eval-after-load "yasnippet-autoloads"
  '(progn
     (if (require 'yasnippet)
         (progn
           (print "Yasnippet-mode")
           ;;;; yasnippet
           ;; should be loaded before auto complete so that they can work
           ;; together
           (yas-global-mode 1))
       (warn "Yasnippet not loaded"))))


(eval-after-load "auto-complete-autoloads"
  '(progn
     ;;;; auto-complete
     (if (require 'auto-complete)
         (progn
           (print "AC-mode")
           ;; Setup custom directories of keyword, etc to be added to the ac
           ;; list.
           ;;(add-to-list 'ac-dictionary-directories (expand-file-name "dict" user-emacs-directory))

           (if (require 'auto-complete-config)
               (progn
                 (print "AC: Auto configuring defaults")
                 (setq-default ac-sources '(ac-source-semantic-raw))
                 (ac-config-default))
             (warn "Could not load auto-complete-config"))
           ;;
           (setq ac-auto-start 1)
           ;; show menu immediately...
           (setq ac-auto-show-menu t)
           ;; explicit call to auto-complete
           (define-key ac-mode-map [(meta return)] 'auto-complete)

           ;; Enable auto-complete-mode for all supported major modes, as
           ;; detailed in ac-modes variable
           (global-auto-complete-mode t)
           ;;(ac-set-trigger-key "TAB")
           )
       (warn "AC mode"))))
;; AC-mode tab fixing
;; http://iany.me/2012/03/fix-tab-binding-for-yasnippet-and-auto-complete/
(defun iy-tab-noconflict ()
  (let ((command (key-binding [tab]))) ; remember command
    (local-unset-key [tab]) ; unset from (kbd "<tab>")
    (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
(add-hook 'ruby-mode-hook 'iy-ac-tab-noconflict)
(add-hook 'markdown-mode-hook 'iy-ac-tab-noconflict)
(add-hook 'org-mode-hook 'iy-ac-tab-noconflict)

;; Don't use the fucking EDE!!
(global-ede-mode 0)

;; Semantic
;;(require 'semantic/ia)
;;(require 'semantic/bovine/gcc)
(semantic-mode t)
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(global-semantic-idle-summary-mode t)
(global-semantic-highlight-edits-mode t)
(global-semanticdb-minor-mode t)


;; C/C++-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; Issues with yasnippet an AC in current AC version.
             ;; In my case, I want AutoComplete to use semantic and yasnippet
             ;; (order matters, if reversed snippets will appear before semantic
             ;; tag completions).
             (setq ac-sources '(ac-source-semantic-raw ac-source-semantic))
             ;;(add-to-list 'ac-sources '(ac-source-semantic ac-source-semantic-raw))
             (local-set-key (kbd "RET") 'newline-and-indent)
             (linum-mode t)
             (semantic-mode t)))



;; Fix for stuff that is only available after the init file has run and thus the
;; package manager has initialised all packages
(add-hook 'after-init-hook
          (lambda ()

            ;; Above is the preferred way to handle packages from the package
            ;; manager.

            ))
