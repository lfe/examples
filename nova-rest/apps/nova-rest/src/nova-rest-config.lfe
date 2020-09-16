(defmodule nova-rest-config
  (behaviour gen_server)
  (export
   (get-cfg 0)
   (table-name 0)
   (table-opts 0)))

(defun get-cfg ()
  (application:get_env 'nova-rest 'ets '()))

(defun table-name ()
  (proplists:get_value 'table-name (get-cfg)))

(defun table-opts ()
  (proplists:get_value 'options (get-cfg)))