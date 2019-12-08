;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname sierpinski-carpet) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)


(define CUTOFF 10)

(@HtDF sierpinski-carpet)
(@signature Integer -> Image)
;; returns a sierpinski carpet with a cutoff of CUTOFF
(check-expect (sierpinski-carpet CUTOFF) (square CUTOFF "solid" "black"))
(check-expect (sierpinski-carpet (* CUTOFF 3))
              (above (beside (square CUTOFF "solid" "black")
                             (square CUTOFF "solid" "black")
                             (square CUTOFF "solid" "black"))
                     (beside (square CUTOFF "solid" "black")
                             (square CUTOFF "solid" "white")
                             (square CUTOFF "solid" "black"))
                     (beside (square CUTOFF "solid" "black")
                             (square CUTOFF "solid" "black")
                             (square CUTOFF "solid" "black"))))

;(define (sierpinski-carpet size) empty-image) ;stub

(define (sierpinski-carpet size)
  (if (<= size CUTOFF)
      (square size "solid" "black")
      (above (beside (sierpinski-carpet (/ size 3))
                     (sierpinski-carpet (/ size 3))
                     (sierpinski-carpet (/ size 3)))
             (beside (sierpinski-carpet (/ size 3))
                     (square (/ size 3) "solid" "white")
                     (sierpinski-carpet (/ size 3)))
             (beside (sierpinski-carpet (/ size 3))
                     (sierpinski-carpet (/ size 3))
                     (sierpinski-carpet (/ size 3))))))