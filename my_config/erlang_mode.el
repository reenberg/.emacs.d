(add-hook 'erlang-mode-hook
          (lambda() ;;; *** erlang-mode Customisation
            (flyspell-prog-mode)
            (flyspell-buffer)))
