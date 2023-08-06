;; Done
(module sn-graph racket
  (provide sn-consistent
           sn-empty
           sn-add-user
           sn-users
           sn-add-frndshp
           )

  ;; required libraries. (imported above)
  ;;(require racket/dict)
  ;;(require racket/set)

  
  ; Hard
  (define (sn-consistent p) #t)

  ;; graph
  ;; -> [a]
  ;; Easy (+0.5)
  (define sn-empty
    empty)

  ;; Easy
  ;; [(k,v)] -> [u]
  (define (sn-users graph)
    (dict-keys graph))

  
  ;; Hard
  ;; [(k,v)] u -> [(k,v)] | (u,{})
  (define (sn-add-user graph user)
    (if (member user (sn-users graph))
        graph
        (dict-set graph user '())))

  ;; Hard
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;;  [(k,v)] | (u1,f1+{f2}) | (u2,f2+{f1})
  ;; ! problem with the order of doing the things, second is not doing
  (define (sn-add-frndshp graph u1 u2)
    (let*
        (
         [fsu1 (dict-ref graph u1)]
         [g2 (dict-set graph u1
                       (set-union fsu1 (list u2)))]
         [fsu2 (dict-ref graph u2)]
         [g3 (dict-set g2 u2               
                       (set-union fsu2 (list u1)))]
         )
      g3
      )
    )
  )