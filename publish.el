(defun roam-sitemap (title list)
  (concat "#+TITLE: " title "\n"
          "#+OPTIONS: ^:nil author:nil html-postamble:nil\n\n"
          ;; "#+SETUPFILE: ./simple_inline.theme\n"
          (org-list-to-org list)
          "\nfile:sitemap.svg"
          ))

(setq my-publish-time 0)   ; see the next section for context
(defun roam-publication-wrapper (plist filename pubdir)
  (org-roam-graph)
  (org-html-publish-to-html plist filename pubdir)
  (setq my-publish-time (cadr (current-time))))

(setq org-publish-project-alist
  '(("roam"
     :base-directory "~/alonso/Jardin_digital"
     :auto-sitemap t
     :sitemap-function roam-sitemap
     :sitemap-title "Jardín digital"
     :publishing-function roam-publication-wrapper
     :publishing-directory "~/alonso/Jardin_digital/html"
     :section-number nil
     :table-of-contents nil)))
