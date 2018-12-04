(require-package 'ycmd)
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

;;;; need change to your own path
(set-variable 'ycmd-server-command '("/usr/bin/python2.7" "/root/ycmd/ycmd/"))
(set-variable 'ycmd-global-config "/root/ycmd/examples/.ycm_extra_conf.py")

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

;;;; Completion framework
(require-package 'company-ycmd)
(require 'company-ycmd)
(company-ycmd-setup)

;;;; Enable flycheck
(require-package 'flycheck-ycmd)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(add-hook 'python-mode-hook (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))
(setq flycheck-indication-mode nil)

(when (not (display-graphic-p))
  (setq flycheck-indication-mode nil))

(require 'ycmd-eldoc)
(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)


(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(add-hook 'ycmd-mode-hook
          '(lambda () (local-set-key (kbd "C-c y .") 'ycmd-goto)))
(add-hook 'ycmd-mode-hook
          '(lambda () (local-set-key (kbd "C-c y t") 'ycmd-get-type)))
(add-hook 'ycmd-mode-hook
          '(lambda () (local-set-key (kbd "C-c y p") 'ycmd-get-parent)))
(add-hook 'ycmd-mode-hook
          '(lambda () (local-set-key (kbd "C-c y d") 'ycmd-show-documentation)))
;; (define-key ycmd-mode-map ycmd-keymap-prefix nil)
;; (setq ycmd-keymap-prefix '(kbd "C-c y"))
;; (define-key ycmd-mode-map ycmd-keymap-prefix
;;              ycmd-command-map)
(provide 'init-ycmd)
