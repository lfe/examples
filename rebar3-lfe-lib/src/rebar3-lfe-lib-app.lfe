(defmodule rebar3-lfe-lib-app
  (behaviour gen_server)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'rebar3-lfe-lib 'all)
  (logger:info "Starting rebar3-lfe-lib application ...")
  (rebar3-lfe-lib-sup:start_link))

(defun stop ()
  (rebar3-lfe-lib-sup:stop)
  'ok)
