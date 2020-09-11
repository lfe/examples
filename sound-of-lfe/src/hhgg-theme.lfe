;;;;;::=------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                     _                                                ;;;;
;;;;                 ,--(_)            .        .     *                   ;;;;
;;;;   *       .    /.    \                                               ;;;;
;;;;                \:.   /                 _.-----._                     ;;;;
;;;;                 `---'          \)|)_ ,'         `. _))|)             ;;;;
;;;;        |                        );-'/             \`-:(              ;;;;
;;;;      -(o)-            .        //  :               :  \\   .         ;;;;
;;;;    .   |                      //_,'; ,.         ,. |___\\            ;;;;
;;;;           .    __,...,--.     `---':(  `-.___.-'  );----'            ;;;;
;;;;              ,' :    |   \          \`. `'-'-'' ,'/                  ;;;;
;;;;             :   |    ;   ::          `.`-.,-.-.','                   ;;;;
;;;;          ,-.|   :  _//`. ;|            ``---\` :                     ;;;;
;;;;         (   \ .- \  `._// |    *             `.'       *             ;;;;
;;;;         |\   :   : _ |.-  :              .        .                  ;;;;
;;;;     .   :\: -:  _|\_||  .-(    _..----..                             ;;;;
;;;;         :_:  _\\_`.--'  _  \,-'      __ \                            ;;;;
;;;;         .` \\_,)--'/ .'    (      ..'--`'          ,-.               ;;;;
;;;;         |.- `-'.-               ,'                (///)              ;;;;
;;;;         :  ,'     .            ;             *     `-'               ;;;;
;;;;   *     :         :           /                                      ;;;;
;;;;          \      ,'         _,'          .                            ;;;;
;;;;           `._       `-  ,-'                       .                  ;;;;
;;;;            : `--..     :        *                         *          ;;;;
;;;;        .   |           |                                             ;;;;
;;;;            |           | SSt                                         ;;;;
;;;;;::=------------------------=::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule hhgg-theme
  (export
   (song 0)
   (song-length 0)))

(include-lib "lfe/include/clj.lfe")

(defun score ()
  '(;; opening chord
    (d4# 0.2)
    (c4 0.3)
    (g3 0.5)
    (d5# 0.9)
    (rest 1.4)

    (f4 0.4)
    (d4# 0.9)
    (rest 0.3)
    (d4 0.5)
    (c4 0.9)
    (rest 0.3)

    ;; second chord
    (d4# 0.2)
    (c4 0.2)
    (g3# 2.0)
    (rest 1.0)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (a3 2.5) ; top
    (rest 0.5)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (g3# 3) ; walk back down (middle)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (g3 2.5) ; bottom
    (rest 0.5)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (g3# 3) ; middle

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (a3 2.5) ; top
    (rest 0.5)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (g3# 2.5) ; middle
    (rest 0.5)

    (f4 0.4)
    (d4# 0.9)
    (c4 0.3)
    (d4 0.5)
    (d4# 0.3)
    (c4 0.9)

    (g3 2.5) ; bottom <-- replace with D# chord, then G chord and F and Cm
    (rest 0.5)

    (rest 1)
    ;; To be continued ...
    ))

(defun play (args)
  (apply #'sound-of-lfe:sound/2 args))

(defun song-length ()
  (lists:sum (lists:map (lambda (x) (cadr x)) (score))))

(defun song ()
  (lists:map #'play/1 (score)))
