
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : menu-source.scm
;; DESCRIPTION : menus for inserting macro-language markup
;;               used for writing style files in source mode.
;; COPYRIGHT   : (C) 1999  Joris van der Hoeven
;;
;; This software falls under the GNU general public license and comes WITHOUT
;; ANY WARRANTY WHATSOEVER. See the file $TEXMACS_PATH/LICENSE for details.
;; If you don't have this file, write to the Free Software Foundation, Inc.,
;; 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (menus menu-source))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Transformational markup for the macro language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind source-define-menu
  ("Assign" (make 'assign))
  ("With" (make-arity 'with 3))
  ("Value" (make 'value)))

(menu-bind source-macro-menu
  ("Macro" (make 'macro))
  ("Argument" (make 'arg))
  ("Compound" (make 'compound))
  ---
  ("Long macro" (make 'xmacro))
  ("Get label" (make 'get-label))
  ("Get arity" (make 'get-arity))
  ("Map arguments" (make 'map-args)))

(menu-bind source-quote-menu
  ("Evaluate" (make 'eval))
  ("Quote" (make 'quote))
  ("Quasi" (make 'quasi))
  ("Quasi-quote" (make 'quasi-quote))
  ("Unquote" (make 'quasi-quote)))

(menu-bind source-flow-menu
  ("If" (make 'if))
  ("Case" (make 'case))
  ;; ("for" (make 'for))
  ("While" (make 'while))
  ;; ("extern" (make 'extern))
  ;; ("authorize" (make 'authorize))
  )

(menu-bind source-transformational-menu
  (-> "Definition" (link source-define-menu))
  (-> "Macro" (link source-macro-menu))
  (-> "Evaluation" (link source-quote-menu))
  (-> "Flow control" (link source-flow-menu)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Executable markup for the macro language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind source-arithmetic-menu
  ("Plus" (make 'plus))
  ("Minus" (make 'minus))
  ("Times" (make 'times))
  ("Over" (make 'over))
  ("Div" (make 'div))
  ("Mod" (make 'mod)))

(menu-bind source-text-menu
  ("Merge" (make 'merge))
  ("Length" (make 'length))
  ("Range" (make 'range))
  ("Number" (make 'number))
  ("Today" (make-arity 'date 0))
  ("Formatted date" (make 'date))
  ("Translate" (make 'translate))
  ("Find file" (make 'find-file)))

(menu-bind source-tuple-menu
  ("Tuple?" (make 'is-tuple))
  ("Merge" (make 'merge))
  ("Length" (make 'length))
  ("Range" (make 'range))
  ("Look up" (make 'look-up)))

(menu-bind source-condition-menu
  ("Not" (make 'not))
  ("And" (make 'and))
  ("Or" (make 'or))
  ("Exclusive or" (make 'xor))
  ---
  ("Equal" (make 'equal))
  ("Not equal" (make 'unequal))
  ("Less" (make 'less))
  ("Less or equal" (make 'lesseq))
  ("Greater" (make 'greater))
  ("Greater or equal" (make 'greatereq)))

(menu-bind source-executable-menu
  (-> "Arithmetic" (link source-arithmetic-menu))
  (-> "Text" (link source-text-menu))
  (-> "Tuple" (link source-tuple-menu))
  (-> "Condition" (link source-condition-menu)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The main menu for editing source files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind source-menu
  (link source-transformational-menu)
  ---
  (link source-executable-menu))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The icon bar for editing source files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind texmacs-source-icons
  (=> (balloon (icon "tm_assign.xpm") "Set or get environment variables")
      (link source-define-menu))
  (=> (balloon (icon "tm_lambda.xpm") "Write a macro")
      (link source-macro-menu))
  (=> (balloon (icon "tm_prime.xpm") "Control the evaluation of expressions")
      (link source-quote-menu))
  (=> (balloon (icon "tm_if.xpm") "Manipulate the control flow")
      (link source-flow-menu))
  |
  (=> (balloon (icon "tm_three.xpm") "Insert an numerical operation")
      (link source-arithmetic-menu))
  (=> (balloon (icon "tm_textual.xpm") "Insert an operation on text")
      (link source-text-menu))
  (=> (balloon (icon "tm_tuple.xpm") "Insert an operation on tuples")
      (link source-tuple-menu))
  (=> (balloon (icon "tm_equal.xpm") "Insert a condition")
      (link source-condition-menu))
  |)
