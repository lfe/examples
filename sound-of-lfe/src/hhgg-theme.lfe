(defmodule hhgg-theme
  (export
   (song 0)))

(include-lib "lfe/include/clj.lfe")

(defun score ()
  '((g4 0.25)
    (d4# 0.25)
    (d4 0.125)
    (c4 0.25)
    (g3 0.25)
    (c3 0.25)
    
    (c5 2)
    
    (c4 0.15)
    (d4 0.85)
    (c4 0.15)
    (d4# 0.85)
    
    (f4 0.5)
    (d4# 0.5)
    (d4 0.5)
    (g3 0.5)
    (d4 0.5)
    (d4# 1.0)
    (c4 0.5)
    
    (c3 0.5)
    (g3# 0.5)
    (d4# 0.75)
    (g3# 0.25)

    ;; To be continued ...
    ))
  
(defun play (args)
  (apply #'sound-of-lfe:sound/2 args))

(defun song-length ()
  (lists:sum (lists:map (lambda (x) (cadr x)) (score))))

(defun song ()
  (lists:map #'play/1 (score)))
