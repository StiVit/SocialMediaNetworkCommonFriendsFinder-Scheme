(module sn-social-network racket

  (provide 
   sn-ff-for
   sn-cmn-frnds-btwn
   sn-cmn-frnds
   sn-frnd-cnt
   sn-frndlst-user
   sn-unfrndlst-user  )

  (require "sn-graph.rkt")
  (require "sn-utils.rkt")
  
  ;; social-network.
  ;; Easy
  ;; [(k,v)]| (u,vu) -> vu
  (define (sn-ff-for graph u1)
    (dict-ref graph u1))


  ;; Medium
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;; f2 & f3
  (define (sn-cmn-frnds-btwn graph u1 u2)
    (set-intersect (dict-ref graph u1)(dict-ref graph u2)) )

  
  ;; Hard
  (define (sn-frnd-cnt graph)
    (define (count-friends user)
      (length (dict-ref graph user)))
    (map (lambda (user)
           (cons user (count-friends user)))
         (sn-users graph)))


  ;; pre: length > 0 
  (define (sn-frndlst-user graph)
    (let* ([frnd-counts (map (lambda (q) (cons (car q) (length (cdr q)))) graph)]
           [max-count (apply max (map cdr frnd-counts))]
           [max-users (filter (lambda (x) (= (cdr x) max-count)) frnd-counts)]
           [max-user-names (map car max-users)])
      (cons max-user-names max-count)))

              
  ;; pre: length > 0
  (define (sn-unfrndlst-user graph)
    (let* ([frnd-counts (map (lambda (q) (cons (car q) (length (cdr q)))) graph)]
           [min-count (apply min (map cdr frnd-counts))]
           [min-users (filter (lambda (x) (= (cdr x) min-count)) frnd-counts)]
           [min-user-names (map car min-users)])
      (cons min-user-names min-count)))

  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds-ff graph u)
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-btwn graph u key))
                keys)]
       
         )
      (sn-dict-ks-vs keys vals)))


  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds graph )
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-ff graph key))
                keys)]
         )
      (sn-dict-ks-vs keys vals)))

  )


