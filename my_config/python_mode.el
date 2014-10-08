;;; package --- Summary
;;; Commentary:

;;; Code:

(add-hook 'python-mode-hook
          (lambda()
            (setq tab-width 4)
            (setq jedi:complete-on-dot t)  ; optional

            (flyspell-prog-mode)
            (flycheck-mode)

            (auto-complete-mode -1)
            ;; First time running this on a new system, make sure to have
            ;; virtualenv install and then run M-x jedi:install-server
            (jedi:setup)))


;;; python_mode.el ends here
