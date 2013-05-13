;; I-do mode for nice completion everywhere (buffer, files, etc.)
(ido-mode t)

;;
(setq ido-file-extensions-order '(;; Text files
                                  ".tex"
                                  ".bib"
                                  ".org"
                                  ".txt"
                                  ;; Programming
                                  ".sml"
                                  ".hs"
                                  ".emacs"))

;; Enable ido to use the ignore-extensions variable
(setq ido-ignore-extensions t)
(setq completion-ignored-extensions '(".hi"
                                      ".so"
                                      ".o"
                                      ".aux"
                                      ".snm"
                                      ".nav"
                                      ".toc"
                                      ".vrb"
                                      ".pyc"
                                      ".elc"))

;; wait for RET, even with unique completion
(setq ido-confirm-unique-completion t)


;; Fix for stuff that is only available after the init file has run and thus the
;; package manager has initialised all packages
(add-hook 'after-init-hook
          (lambda ()
            ;; Use ido everywhere
            (ido-ubiquitous-mode t)
            ))

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))
