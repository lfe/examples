(defmodule sound-of-lfe
  (export (main 1)))

(include-lib "lfe/include/clj.lfe")

(defun out-dir () "./out/")

;;;;;::=-------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   entry point function    -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun main (args)
  (filelib:ensure_dir (out-dir))
  (case (car args)
    ("first" (-> (wave 1 48000)
                 (save (++ (out-dir) "first-wave.raw"))
                 (play)))
    (unkn (io:format "Unsupported command: '~s'~n" `(,unkn))))
  (erlang:halt 0))

;;;;;::=-----------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   miscellaneous functions     -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-----------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun wave (start stop)
  (list-comp
    ((<- x (lists:seq start stop)))
    (math:sin x)))

(defun save (audio-data filename)
  (case (->> audio-data
             (lists:foldl (lambda (x acc)
                            (binary (acc bytes) (x float)))
                          (binary))
             (file:write_file filename))
    ('ok filename)
    (err (io:format "Error saving: ~p~n" `(,err)))))

(defun play (filename)
  (let* ((input-format "-f f64be")   ; 64-bit, big-endian float
         (sampling-rate "-ar 48000") ; 48kHz
         (cmd (io_lib:format "ffplay ~s ~s ~s"
                             `(,input-format ,sampling-rate ,filename))))
    (io:format "Play command; '~s'~n" `(,cmd))
    (os:cmd cmd)))