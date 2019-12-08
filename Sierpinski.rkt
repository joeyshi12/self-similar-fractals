;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Sierpinski) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)


(define CUTOFF 10)

(@HtDF sierpinski)
(@signature Integer -> Image)
;; returns a sierpinski triangle with a cutoff of CUTOFF
(check-expect (sierpinski CUTOFF) (triangle CUTOFF "outline" "red"))
(check-expect (sierpinski (* CUTOFF 2))
              (above (triangle CUTOFF "outline" "red")
                     (beside (triangle CUTOFF "outline" "red")
                             (triangle CUTOFF "outline" "red"))))

;(define (sierpinski size) empty-image) ;stub

(define (sierpinski size)
  (if (<= size CUTOFF)
      (triangle size "outline" "red")
      (above (sierpinski (/ size 2))
             (beside (sierpinski (/ size 2)) (sierpinski (/ size 2))))))