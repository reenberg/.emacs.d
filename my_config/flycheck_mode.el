;; For almost all supported languages, Flycheck also needs additional
;; *external* checker programs.  See *note Supported languages: 35. for a
;; list of supported languages and the corresponding checkers programs,
;; and use *note flycheck-describe-checker: 36. to get help about specific
;; checkers inside Emacs.
(add-hook 'after-init-hook #'global-flycheck-mode)
