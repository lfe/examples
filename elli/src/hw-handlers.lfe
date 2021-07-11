(defmodule hw-handlers
  (behaviour elli_handler)
  (export
   (handle 2)
   (handle_event 3)))

(include-lib "logjam/include/logjam.hrl")

(defun handle (req _args)
  (handle (elli_request:method req)
          (elli_request:path req)
          req))

(defun handle
  (('GET '(#"hello" #"world") _req)
   #(200 () #"Hello, world!"))
  (('GET `(#"hello" ,name) _req)
   `#(200 () (#"Hello, " ,name #".")))
  ((_ _ _req)
   #(404 () #"Not Found")))

(defun handle_event (event data args)
  (log-info "Got event: ~p" `(,event))
  (log-debug "Got data: ~p" `(,data))
  (log-debug "Got args: ~p" `(,args))
  'ok)