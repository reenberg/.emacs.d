;; REMEMBER
;; "setq" is buffer local, so things that are buffer specific such as
;; tab-width will not be set in every buffer unless set with
;; "setq-default"!

;; EMACS 24 PACKAGE system!
;; Whenever Emacs24 starts up, it automatically calls the function
;; ‘package-initialize’ to load installed packages. This is done after loading
;; the init file and abbrev file (if any) and before running ‘after-init-hook’
;; (see Startup Summary). Automatic package loading is disabled if the user
;; option package-enable-at-startup is nil.
;;
;; http://www.emacswiki.org/emacs-fr/ELPA:
;; So packages are initialized AFTER the init.el is loaded. This means you
;; should NOT put package specific initialization into your init.el except in a
;; few ways:
;;
;; * customization variables for a package are fine, they can be set
;;   before a package has loaded
;;
;; * auto-mode-alist changes can be made in a way that does not
;;   require the package to be loaded before they are setup
;;
;; * mode specific customization of a package could go in a package
;;   hook which can be set before the package is loaded.
;;
;; * key bindings can also be done in such a way to not cause init
;;   failure, even if the package is not loaded
;;
;; * if all these tricks don’t work you can still postpone config
;;   until after the packages have been loaded. (after-init-hook)


;; Setup the "ELPA"/packaging system for emacs 24. If using emacs 23, then the
;; package.el must be update from the emacs 24 repo.
;; See: http://emacs-fu.blogspot.dk/2011/11/package-management-revisited.html
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; Fix for stuff that is only available after the init file has run and thus the
;; package manager has initialised all packages
(add-hook 'after-init-hook
          (lambda ()
            ;; Solarized theme, which is supposed to be nice?
            ;;(load-theme 'solarized-[light|dark] t)
            ;(setq solarized-termcolors 256) ; set 256 term colors
            (when window-system
              ;; The theme only works in terminals, if the terminal
              ;; has been configured. For simplicity only enable if
              ;; we a running emacs through a window system
              (load-theme 'solarized-light t)
              )))



;; Set my email address
(setq user-mail-address "jesper.reenberg@gmail.com")

;; Load this iso translation library to handle dead keys. For some reason this
;; became an error when upgrading to ubuntu jaunty. The error message is
;; "<S-dead-xxx> is not defined" and this make "C-c `" not work in Auctex
(load-library "iso-transl")

;; If the shell is using colours, then enable this,
;; else it will print the color "codes".
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Turn off mouse interface early in startup to avoid momentary display
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen
(setq inhibit-startup-message t)


;; Load external stufff......
; add ~/.emacs.d/ to load path.
(add-to-list 'load-path user-emacs-directory)
;; Keep all the damn files emacs creates elsewhere
(setq emacs-file-dir
      (expand-file-name "~/.emacs.files"))
;; Set path to dependencies/external projects that can't be downloaded through
;; the package manager
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))


;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


; Set up my_config directory.
(load "my_config/misc.el")
(load "my_config/sml_mode.el")
(load "my_config/haskell_mode.el")
(load "my_config/erlang_mode.el")
(load "my_config/ocaml_mode.el")
(load "my_config/auctex_mode.el")
(load "my_config/org_mode.el")
(load "my_config/ido_mode.el")
(load "my_config/shell_mode.el")
(load "my_config/bm_mode.el")

(load "my_config/my_funs.el")
(load "my_config/bindings.el")


;; Keep emacs Custom-settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
