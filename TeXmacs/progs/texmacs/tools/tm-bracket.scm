
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : tm-brackets.scm
;; DESCRIPTION : quotes and auto-close brackets
;; COPYRIGHT   : (C) 2001  Joris van der Hoeven
;;
;; This software falls under the GNU general public license and comes WITHOUT
;; ANY WARRANTY WHATSOEVER. See the file $TEXMACS_PATH/LICENSE for details.
;; If you don't have this file, write to the Free Software Foundation, Inc.,
;; 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (texmacs tools tm-bracket)
  (:export
    insert-quote
    make-bracket-open make-separator make-bracket-close make-big-operator))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User preferences for quoting and bracket behaviour
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define quoting-style "default")
(define auto-close-brackets? #f)

(define (notify-quoting-style var val)
  (set! quoting-style val))

(define (notify-auto-close-brackets var val)
  (set! auto-close-brackets? (== val "on")))

(define-preferences
  ("automatic quotes" "default" notify-quoting-style)
  ("automatically close brackets" "off" notify-auto-close-brackets))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quotes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (close-quotes?)
  (let* ((p (tm-where))
	 (t (tree->stree (tm-subtree (cDr p)))))
    (if (string? t)
	(not (or (== t "") (string-ends? t " ")))
	(> (cAr p) 0))))

(define (open-quotes lan)
  (cond ((== lan "none") (insert "\""))
	((== lan "danish") (insert "''"))
	((== lan "dutch") (insert ""))
	((== lan "french") (insert " "))
	((== lan "german") (insert ""))
	((== lan "spanish") (insert ""))
	((== lan "swiss") (insert ""))
	((== lan "polish") (insert ""))
	(else (insert "``"))))

(define (close-quotes lan)
  (cond ((== lan "none") (insert "\""))
	((== lan "danish") (insert "''"))
	((== lan "dutch") (insert "''"))
	((== lan "french") (insert " "))
	((== lan "german") (insert "``"))
	((== lan "spanish") (insert ""))
	((== lan "swiss") (insert ""))
	((== lan "polish") (insert "''"))
	(else (insert "''"))))

(define (insert-quote-both lan)
  (cond ((== lan "none") (insert "\""))
	((== lan "danish") (insert-go-to "''''" '(2)))
	((== lan "dutch") (insert-go-to "''" '(1)))
	((== lan "french") (insert-go-to "  " '(2)))
	((== lan "german") (insert-go-to "``" '(1)))
	((== lan "spanish") (insert-go-to "" '(1)))
	((== lan "swiss") (insert-go-to "" '(1)))
	((== lan "polish") (insert-go-to "''" '(1)))
	(else (insert-go-to "``''" '(2)))))

(define (insert-quote-sub lan)
  (cond (auto-close-brackets? (insert-quote-both lan))
	((close-quotes?) (close-quotes lan))
	(else (open-quotes lan))))

(define (insert-quote)
  (if (== quoting-style "default")
      (insert-quote-sub (get-env "language"))
      (insert-quote-sub quoting-style)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bracket routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-bracket-open l r . opt)
  (let ((large? (== opt '(#t)))
	(sel? (selection-active-normal?)))
    (if auto-close-brackets?
	(begin
	  (if sel? (clipboard-cut "temp"))
	  (if large?
	      (insert-go-to `(concat (left ,l) (right ,r)) '(1 0))
	      (insert-go-to (string-append l r) (list (string-length l))))
	  (if sel? (clipboard-paste "temp")))
	(if large?
	    (insert `(left ,l))
	    (insert l)))))

(define (make-separator sep . opt)
  (let ((large? (== opt '(#t))))
    (if large?
	(insert `(mid ,sep))
	(insert sep))))

(define (make-bracket-close r l . opt)
  (let ((large? (== opt '(#t))))
    (if large?
	(insert `(right ,r))
	(insert r))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Big operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-big-operator op)
  (let ((sel? (selection-active-normal?)))
    (if (and auto-close-brackets? (!= op "."))
	(begin
	  (if sel? (clipboard-cut "temp"))
	  (insert-go-to `(concat (big ,op) (big ".")) '(1 0))
	  (if sel? (clipboard-paste "temp")))
	(insert `(big ,op)))))
