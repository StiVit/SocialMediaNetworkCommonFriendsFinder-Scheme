;; Done

(module sn-utils racket

  (provide sn-dict-ks-vs
           sn-line->entry
           sn-list->dict
           )

 
  ;; utils
  ;; [k] [v] -> [(k,v)]
  ;; Easy
  (define (sn-dict-ks-vs ks vs)  
    (if (and (not (null? ks))
             (not (null? vs)))
        (cons (cons (car ks)(car vs))
              (sn-dict-ks-vs (cdr ks)(cdr vs)))
        '()))

  ;; Medium
  ;; str -> (a,[a])
  (define (sn-line->entry ln)
    (let
        (
         [lst (string-split ln)])
      (cons (car lst)
            (cdr lst))))

  ;; [(a,b)] -> [(a,b)] 
  ;; Easy
  (define (sn-list->dict es)
    es)
 
  )