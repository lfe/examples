(defmodule nova-rest.config
  (export
   (get-cfg 0)
   (table-name 0)
   (table-opts 0)))

(defun get-cfg ()
  (application:get_env 'nova_rest_lfe 'ets '()))

(defun table-name ()
  (proplists:get_value 'table-name (get-cfg)))

(defun table-opts ()
  (proplists:get_value 'options (get-cfg)))