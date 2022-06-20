  (defun org-md-example-block (example-block _contents info)
    "Transcode EXAMPLE-BLOCK element into Markdown format.
CONTENTS is nil.  INFO is a plist used as a communication
channel."
     (concat "```"
     (or (plist-get (cadr example-block) :language) "")
     "\n"
     (org-remove-indentation
      (let ((
             templated-string (org-export-format-code-default example-block info)
             ))
        (dolist (elt org-macro-templates templated-string)
          (setq templated-string (string-replace (concat "{{{" (car elt) "}}}") (cdr elt) templated-string)))
        templated-string)
      )
     "```"))
