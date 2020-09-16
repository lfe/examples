(defmodule sample-app-util
  (export all))

(defun get-version ()
  (lanes.util:app-version 'lfeapp))

(defun get-versions ()
  (++ (lanes.util:versions)
      `(#(yaws ,(lanes.util:app-version 'yaws)))
      `(#(lfeapp ,(get-version)))))
