;;; package --- Summary
;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mako\\'" . web-mode))

(setq web-mode-engines-alist '(("php" . "\\.phtml\\'")
                               ("mako" . "\\.mako\\.")))


;;; web-mode.el ends here
