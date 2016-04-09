(defmodule sample-app-nav
  (export all))

(include-lib "exemplar/include/html-macros.lfe")

(defun get-side-menu ()
  (list
    (li (a '(href "/") "Main Page"))
    (li (a '(href "/content/1") "/content/1"))
    (li (a '(href "/content/2") "/content/2"))
    (li (a '(href "/content/3") "/content/3"))
    (li (a '(href "/relation/1/2") "/relation/1/2"))
    (li (a '(href "/bob") "404"))))

(defun get-navbar()
  (nav '(class "navbar navbar-default navbar-fixed-top")
    (div '(class "container")
      (div '(class "navbar-header")
        (div '(id "navbar" class "navbar-collapse collapse")
          (ul '(class "nav navbar-nav navbar-right")
            (get-side-menu)))))))

