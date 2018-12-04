;; (use-package neotree
;;   :ensure t
;;   :bind (([f8] . neotree-toggle))
;;   :config (setq neo-autorefresh nil))




(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
  (interactive)
  (let ((project-dir
         (ignore-errors
;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
           (ffip-project-root)
           ))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
            (neotree-dir project-dir))
        (if file-name
            (neotree-find file-name))))))

(define-key global-map (kbd "M-e") 'neotree-project-dir-toggle)

(provide 'init-neotree)
