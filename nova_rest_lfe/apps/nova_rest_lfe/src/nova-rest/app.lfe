(defmodule nova-rest.app
  (behaviour gen_server)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

(include-lib "logjam/include/logjam.hrl")

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (log-info "Starting nova-rest application ...")
  (ets:new (nova-rest.config:table-name)
           (nova-rest.config:table-opts))
  (nova-rest.sup:start_link))

(defun stop ()
  (nova-rest.sup:stop)
  'ok)
