(defmodule sound-of-lfe
  (export all))

(include-lib "lfe/include/clj.lfe")

(defun out-dir () "./out/")
(defun default-sample-rate () 48000)
(defun a440 () 440)
(defun bpm () 120)
(defun beat-duration () (/ 60 (bpm)))

;;;;;::=------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   entry point function   -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun main (args)
  (filelib:ensure_dir (out-dir))
  (case (car args)
    ("first" (let ((duration 1))
               (-> (wave 1 (default-sample-rate))
                   (save (++ (out-dir) "first-wave.raw"))
                   (play duration))))
    ("a440" (let ((duration 2))
              (-> (frequency (a440) 1)
                  (save (++ (out-dir) "a-440-wave.raw"))
                  (play duration))))
    ("two-notes" (let ((longest 2))
                   (-> (frequencies
                        `((261.63 1)
                          (783.99 ,longest)))
                       (save (++ (out-dir) "two-notes.raw"))
                       (play longest))))
    ("semi-tones" (-> (list-comp
                       ((<- semitone (lists:seq 0 12)))
                       (sound-tone semitone 0.5))
                     (lists:flatten)
                     (save (++ (out-dir) "semi-tones.raw"))
                     (play 13)))
    ("hhgg-opening" (-> (list-comp
                          ((<- note '(g4 d4# c4 g3 c3 c5)))
                          (sound note 0.25))
                        (lists:flatten)
                        (save (++ (out-dir) "hhgg-opening.raw"))
                        (play 6)))
    ("hhgg-theme" (-> (hhgg-theme:song)
                      (lists:flatten)
                      (save (++ (out-dir) "hhgg-opening.raw"))
                      (play 6)))
    (unkn (io:format "Unsupported command: '~s'~n" `(,unkn))))
  (erlang:halt 0))

;;;;;::=-----------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   envelope functions    -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-----------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun attack (len)
  (list-comp
    ((<- multi (lists:seq 1 len)))
    (min (/ multi 1000) 1)))

(defun release (len)
  (lists:reverse (attack len)))

;;;;;::=--------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   sound functions    -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=--------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun notes (names)
  (lists:map #'note/1 names))

(defun note (name)
  (case name
    ('c3 (get-tone -21))
    ('c3# (get-tone -20))
    ('d3 (get-tone -19))
    ('d3# (get-tone -18))
    ('e3 (get-tone -17))
    ('f3 (get-tone -16))
    ('f3# (get-tone 15))
    ('g3 (get-tone -14))
    ('g3# (get-tone -13))
    ('a3 (get-tone -12))
    ('a3# (get-tone -11))
    ('b3 (get-tone -10))
    ('c4 (get-tone -9))
    ('c4# (get-tone -8))
    ('d4 (get-tone -7))
    ('d4# (get-tone -6))
    ('e4 (get-tone -5))
    ('f4 (get-tone -4))
    ('f4# (get-tone -3))
    ('g4 (get-tone -2))
    ('g4# (get-tone -1))
    ('a4 (get-tone 0))
    ('a4# (get-tone 1))
    ('b4 (get-tone 2))
    ('c5 (get-tone 3))
    ('c5# (get-tone 4))
    ('d5 (get-tone 5))
    ('d5# (get-tone 6))
    ('e5 (get-tone 7))
    ('f5 (get-tone 8))
    ('f5# (get-tone 9))
    ('g5 (get-tone 10))
    ('g5# (get-tone 11))
    ('a5 (get-tone 12))
    ('a5# (get-tone 13))
    ('b5 (get-tone 14))
    ('c6 (get-tone 15))
    ('c6# (get-tone 16))
    ('d6 (get-tone 17))
    ('d6# (get-tone 18))
    ('e6 (get-tone 19))
    ('f6 (get-tone 20))
    ('f6# (get-tone 21))
    ('g6 (get-tone 22))
    ('g6# (get-tone 23))
    ('a6 (get-tone 24))
    ('a6# (get-tone 25))
    ('b6 (get-tone 26))
    ('c7 (get-tone 27))))

(defun sound (note-name beats)
  (frequency (note note-name)
             (* beats (beat-duration))))

(defun sound-tone (semitones-shift beats)
  (frequency (get-tone semitones-shift)
             (* beats (beat-duration))))

(defun get-tone (semitones)
  (-> (math:pow 2 (/ 1.0 12.0))
      (math:pow semitones)
      (* (a440))))

(defun frequency (cycles duration)
  (frequency cycles duration (default-sample-rate)))

(defun frequency (cycles duration sample-rate)
  (frequency cycles 1 duration sample-rate))

(defun frequency (cycles start duration sample-rate)
  (let* ((signals (lists:seq start (round (* sample-rate duration))))
         (step (/ (* 2 cycles (math:pi)) sample-rate))
         (output (list-comp
                   ((<- signal signals))
                   (math:sin (* step signal))))
         (len (length output)))
    (lists:zipwith3 (lambda (a r o) (* a r o))
                    (attack len)
                    (release len)
                    output)))

(defun frequencies (args-list)
  (lists:flatten
   (lists:map
    (lambda (args) (apply #'frequency/2 args))
    args-list)))

(defun wave (start stop)
  (list-comp
    ((<- x (lists:seq start stop)))
    (math:sin x)))

;;;;;::=-----------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;::=-   i/o functions   -=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;::=-----------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    ;;(io:format "DEBUG: play command: '~s'~n" `(,cmd))
    (os:cmd cmd)))
