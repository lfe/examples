(defmodule nova-rest.controllers.pet
  (export
   (manage 1)))

(include-lib "logjam/include/logjam.hrl")

(defun manage
  ;;
  ;; GET Handler
  ;;
  ((`#m(req #m(method #"GET"
               bindings #m(petid ,pet-id))))
   (case (ets:lookup (nova-rest.config:table-name) pet-id)
     ('()
      #(status 404))
     (`(#(,pet-id ,name))
      `#(status 200 #m() ,(json:encode `#m(#"id" ,pet-id #"name" ,name) '(maps binary))))))
  ;;
  ;; GET Handler (all)
  ;;
  ((`#m(req #m(method #"GET")))
   (let* ((pets (ets:tab2list (nova-rest.config:table-name)))
          (body (list-comp
                  ((<- `#(,pet-id ,name) pets))
                  `#m(#"id" ,pet-id #"name" ,name))))
     `#(status 200 #m() ,(json:encode body '(maps binary)))))  
  ;;
  ;; PUT Handler
  ;;
  ((`#m(req #m(method #"PUT"
               bindings #m(petid ,pet-id))
        json #m(#"name" ,name)))
   (let* (('true (ets:delete (nova-rest.config:table-name) pet-id))
          ('true (ets:insert (nova-rest.config:table-name) `#(,pet-id ,name))))
     `#(status 200 #m() ,(json:encode `#m(#"id" ,pet-id #"name" ,name) '(maps binary)))))
  ;;
  ;; DELETE Handler
  ;;
  ((`#m(req #m(method #"DELETE"
               bindings #m(petid ,pet-id))))
   (let (('true (ets:delete (nova-rest.config:table-name) pet-id)))
     #(status 200)))
  ;;
  ;; POST Handler
  ;;
  ((`#m(req #m(method #"POST")
        json #m(#"name" ,name)))
   (let* ((pet-id (list_to_binary (uuid:uuid_to_string (uuid:get_v4))))
          ('true (ets:insert (nova-rest.config:table-name) `#(,pet-id ,name))))
     (log-debug "Pet ID: ~p" `(,pet-id))
     `#(status 201 #m() ,(json:encode `#m(#"id" ,pet-id #"name" ,name) '(maps binary))))))
