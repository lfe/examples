(defmodule sample-app-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'lfeyawsdemo))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(lfeyawsdemo ,(get-version)))))
