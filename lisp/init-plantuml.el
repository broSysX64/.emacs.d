;; PlantUML
(use-package plantuml-mode
  :mode "\\.plantuml\\'"
  :config (setq plantuml-jar-path
                (expand-file-name "/root/plantuml.jar"))
  )

;; Flycheck-plantuml/
(use-package flycheck-plantuml
  :after flycheck
  :config (flycheck-plantuml-setup)
  )

(setq plantuml-java-args '("-jar"))

(setq plantuml-jar-path (expand-file-name "/root/plantuml.jar"))

(provide 'init-plantuml)
