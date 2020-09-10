(defmodule sound-of-lfe
  (export (main 1)))

(include-lib "lfe/include/clj.lfe")

(defun out-dir () "./out/")
(defun default-sample-rate () 48000)

;;;;;::=-------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   entry point function    -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun main (args)
  (filelib:ensure_dir (out-dir))
  (case (car args)
    ("first" (let ((duration 1))
               (-> (wave 1 (default-sample-rate))
                   (save (++ (out-dir) "first-wave.raw"))
                   (play duration))))
    ("a440" (let ((duration 2))
              (-> (frequency 440 1 (default-sample-rate))
                  (save (++ (out-dir) "a-440-wave.raw"))
                  (play duration))))
    ("two-notes" (let ((longest 2))
                   (-> (frequencies
                        `((261.63 1 ,(default-sample-rate))
                          (783.99 ,longest ,(default-sample-rate))))
                       (save (++ (out-dir) "two-notes.raw"))
                       (play longest))))
    (unkn (io:format "Unsupported command: '~s'~n" `(,unkn))))
  (erlang:halt 0))

;;;;;::=-----------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   miscellaneous functions     -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-----------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun frequency (cycles duration sample-rate)
  (frequency cycles 1 duration sample-rate))

(defun frequency (cycles start duration sample-rate)
  (let ((signals (lists:seq start (round (* sample-rate duration))))
        (step (/ (* 2 cycles (math:pi)) sample-rate)))
    (list-comp
      ((<- signal signals))
      (math:sin (* step signal)))))                              

(defun frequencies (args-list)
  (lists:flatten
   (lists:map
    (lambda (args) (apply #'frequency/3 args))
    args-list)))

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

(defun play (filename duration)
  (let* ((input-format "-f f64be")                ; 64-bit, big-endian float
         (sample-rate (io_lib:format "-ar ~p" `(,(default-sample-rate))))
         (no-vid "-vn")                           ; disable video
         (no-graph "-nodisp")                     ; disable graphical display
         (s (io_lib:format "-t ~p" `(,duration))) ; play for t seconds
         (ae "-autoexit")                         ; exit after playing
         (cmd (io_lib:format "ffplay ~s ~s ~s ~s ~s ~s ~s"
                             `(,input-format ,sample-rate ,no-vid
                               ,no-graph ,s ,ae ,filename))))
    (io:format "Play command; '~s'~n" `(,cmd))
    (os:cmd cmd)))