(defmodule sample-app-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'lfeyawsdemo))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(yaws ,(lutil:get-app-version 'yaws)))
      `(#(lfeyawsdemo ,(get-version)))))
