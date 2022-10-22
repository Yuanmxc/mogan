
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : math-speech-fr.scm
;; DESCRIPTION : mathematical editing using French speech
;; COPYRIGHT   : (C) 2022  Joris van der Hoeven
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (math math-speech-fr)
  (:use (math math-speech-en)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sanitize input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(tm-define (speech-sanitize lan mode s)
  (:require (and (== lan 'french) (== mode 'math)))
  (set! s (locase-all s))
  (set! s (list->tmstring (clean-letter-digit (tmstring->list s))))
  (set! s (string-replace s "+" " plus "))
  (set! s (string-replace-trailing s "-" " moins "))
  (set! s (string-replace s "<times>" " fois "))
  (set! s (string-replace-trailing s "." " point "))
  (set! s (string-replace s "," " virgule "))
  (set! s (string-replace s ":" " double points "))
  (set! s (string-replace s ";" " point virgule "))
  (set! s (string-replace s "^" " chapeau "))
  (set! s (string-replace s "~" " tilde "))
  (set! s (string-replace s "<ldots>" " points "))
  (set! s (string-replace s "<cdots>" " points "))
  (set! s (string-replace s "  " " "))
  (set! s (string-replace s "  " " "))
  (set! s (tm-string-trim-both s))
  s)

(speech-collection dont-break french
  "ah" "an" "au" "el" "en" "es" "et" "ex" "il" "oh" "ou" "un"
  "ma" "ta" "za" "de" "he" "le" "se" "te"
  "ai" "bi" "hi" "ji" "pi" "si" "ti" "xi"
  "ho" "no" "to" "du" "mu" "nu" "ou")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Entering mathematical symbols via English speech
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(speech-symbols french
  ("zéro" "0")
  ("un" "1")
  ("deux" "2")
  ("trois" "3")
  ("quatre" "4")
  ("cinq" "5")
  ("six" "6")
  ("sept" "7")
  ("huit" "8")
  ("neuf" "9")
  ("dix" "10")
  ("cent" "100")
  ("mille" "1000")
  ("million" "1000000")
  ("milliard" "1000000000")

  ("a" "a")
  ("b" "b")
  ("c" "c")
  ("d" "d")
  ("e" "e")
  ("f" "f")
  ("g" "g")
  ("h" "h")
  ("i" "i")
  ("j" "j")
  ("k" "k")
  ("l" "l")
  ("m" "m")
  ("n" "n")
  ("o" "o")
  ("p" "p")
  ("q" "q")
  ("r" "r")
  ("s" "s")
  ("t" "t")
  ("u" "u")
  ("v" "v")
  ("w" "w")
  ("x" "x")
  ("y" "y")
  ("z" "z")

  ("alpha" "<alpha>")
  ("beta" "<beta>")
  ("gamma" "<gamma>")
  ("delta" "<delta>")
  ("epsilon" "<varepsilon>")
  ("zeta" "<zeta>")
  ("eta" "<eta>")
  ("theta" "<theta>")
  ("iota" "<iota>")
  ("kappa" "<kappa>")
  ("lambda" "<lambda>")
  ("mu" "<mu>")
  ("nu" "<nu>")
  ("xi" "<xi>")
  ("omicron" "<omicron>")
  ("pi" "<pi>")
  ("rho" "<rho>")
  ("sigma" "<sigma>")
  ("tau" "<tau>")
  ("upsilon" "<upsilon>")
  ("phi" "<varphi>")
  ("psi" "<psi>")
  ("chi" "<chi>")
  ("omega" "<omega>")

  ("constante e" "<mathe>")
  ("constante i" "<mathi>")
  ("constante pi" "<mathpi>")
  ("constante gamma" "<mathgamma>")
  ("constante d'euler" "<mathgamma>")

  ("infini" "<infty>")
  ("complexes" "<bbb-C>")
  ("entiers positifs" "<bbb-N>")
  ("rationnels" "<bbb-Q>")
  ("réels" "<bbb-R>")
  ("entiers" "<bbb-Z>")

  ("plus" "+")
  ("moins" "-")
  ("fois" "*")
  ("croix" "<times>")
  ("tenseur" "<otimes>")
  ("factoriel" "!")

  ("égal" "=")
  ("non égal" "<neq>")
  ("inférieur" "<less>")
  ("inférieur égal" "<leqslant>")
  ("supérieur" "<gtr>")
  ("supérieur égal" "<geqslant>")
  ("dans" "<in>")
  ("contient l'élément" "<ni>")
  ("sous ensemble" "<subset>")
  ("sur ensemble" "<supset>")

  ("similaire" "<sim>")
  ("asymptotique" "<asymp>")
  ;;("approx" "<approx>")
  ("isomorphe" "<cong>")
  ("négligeable" "<prec>")
  ("dominé" "<preccurlyeq>")
  ("domine" "<succcurlyeq>")
  ("domine strictement" "<succ>")

  ("flèche" "<rightarrow>")
  ("longue flèche" "<rightarrow>")

  ("pour tout" "<forall>")
  ("existe" "<exists>")
  ("ou" "<vee>")
  ("et" "<wedge>")
  ("implique" "<Rightarrow>")
  ("équivaut" "<Leftrightarrow>")

  ("point" ".")
  ("virgule" ",")
  ("double point" ":")
  ("point virgule" ";")
  ("point d'exclamation" "!")
  ("point d'interrogation" "?")
  ("." ".")
  ("," ",")
  (":" ":")
  (";" ";")
  ("!" "!")
  ("?" "?")
  ("tel que" "<suchthat>")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; More complex mathematical speech commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(speech-map french math
  ("grand" (speech-alter-letter :big))
  ("petit" (speech-alter-letter :small))
  ("majuscule" (speech-alter-letter* :big))
  ("minuscule" (speech-alter-letter* :small))
  ("gras" (speech-alter-letter* :bold))
  ("medium" (speech-alter-letter* :medium))
  ("droit" (speech-alter-letter* :up))
  ("italique" (speech-alter-letter* :it))
  ("calligraphique" (speech-alter-letter* :cal))
  ("fraktur" (speech-alter-letter* :frak))
  ("tableau noir gras" (speech-alter-letter* :bbb))
  ("normal" (speech-alter-letter* :normal))
  ("sans serif" (speech-alter-letter* :ss))
  ("machine à écrire" (speech-alter-letter* :tt))
  ("opérateur" (speech-operator))

  ("facteur" (speech-factor))
  ("inverse" (speech-insert-superscript "-1"))
  ("carré" (speech-insert-superscript "2"))
  ("cube" (speech-insert-superscript "3"))
  ("indice" (speech-subscript))
  ("puissance" (speech-superscript))
  ;;("subscript" (make 'rsub))
  ("exposant" (make 'rsup))

  ("prime" (make-rprime "'"))
  ("double prime" (make-rprime "'") (make-rprime "'"))
  ("triple prime" (make-rprime "'") (make-rprime "'") (make-rprime "'"))
  ;;("dagger" (make-rprime "<dag>"))
  ;;("star" (make-rprime "<asterisk>"))

  ("chapeau" (speech-accent "^"))
  ("tilde" (speech-accent "~"))
  ("barre" (speech-accent "<bar>"))
  ("large chapeau" (speech-wide "^"))
  ("large tilde" (speech-wide "~"))
  ("large barre" (speech-wide "<bar>"))
  ("chapeau dessous" (speech-accent-under "^"))
  ("tilde dessous" (speech-accent-under "~"))
  ("barre dessous" (speech-accent-under "<bar>"))
  ("large chapeau dessous" (speech-wide-under "^"))
  ("large tilde dessous" (speech-wide-under "~"))
  ("large barre dessous" (speech-wide-under "<bar>"))

  ("de" (speech-of))
  ("parenthèses" (math-bracket-open "(" ")" 'default))
  ("crochets" (math-bracket-open "[" "]" 'default))
  ("accolades" (math-bracket-open "{" "}" 'default))
  ("chevrons" (math-bracket-open "<langle>" "<rangle>" 'default))
  ("partie entière" (math-bracket-open "<lfloor>" "<rfloor>" 'default))

  ("exponentielle" (speech-insert-operator "exp"))
  ("exponentielle de" (speech-insert-function "exp"))
  ("logarithme" (speech-insert-operator "log"))
  ("logarithme de" (speech-insert-function "log"))
  ("sinus" (speech-insert-operator "sin"))
  ("sinus de" (speech-insert-function "sin"))
  ("cosinus" (speech-insert-operator "cos"))
  ("cosinus de" (speech-insert-function "cos"))
  ("tangente" (speech-insert-operator "tan"))
  ("tangente de" (speech-insert-function "tan"))
  
  ("plus points plus" (insert "+<cdots>+"))
  ("moins points moins" (insert "-<cdots>-"))
  ("fois points fois" (insert "*<cdots>*"))
  ("virgule points virgule" (insert ",<ldots>,"))
  ("et points et" (insert "<wedge><cdots><wedge>"))
  ("ou points ou" (insert "<vee><cdots><vee>"))
  ("égal points égal" (insert "=<cdots>="))
  ("similar points similar" (insert "<sim><cdots><sim>"))
  ("inférieur points inférieur" (insert "<less><cdots><less>"))
  ("inférieur égal points inférieur égal" (insert "<leqslant><cdots><leqslant>"))
  ("supérieur points supérieur" (insert "<gtr><cdots><gtr>"))
  ("supérieur égal points supérieur égal" (insert "<geqslant><cdots><geqslant>"))
  ("tenseur points tenseur" (insert "<otimes><cdots><otimes>"))

  ("somme" (math-big-operator "sum"))
  ("produit" (math-big-operator "prod"))
  ("intégrale" (math-big-operator "int"))
  ("intégrale de contours" (math-big-operator "oint"))
  ("intégrale double" (math-big-operator "iint"))
  ("intégral triple" (math-big-operator "iiint"))
  ("pour" (speech-for))
  ("jusqu'à" (speech-until))

  ("racine carrée" (make 'sqrt))
  ("racine carrée de" (speech-sqrt))
  ("fraction" (make 'frac))
  ("sur" (speech-over))
  ("numérateur" (go-to-fraction :numerator))
  ("dénominateur" (go-to-fraction :denominator))

  ("matrice" (make 'matrix))
  ("déterminant" (make 'det))
  ("choix" (make 'choice))
  ("points horizontaux" (insert "<cdots>"))
  ("points verticaux" (insert "<vdots>"))
  ("points diagonaux" (insert "<ddots>"))
  ("points montants" (insert "<udots>"))

  ;;("more" "var")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Speech reductions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(speech-reduce french math
  ("lettre a" "a")
  ("lettre b" "b")
  ("lettre c" "c")
  ("lettre d" "d")
  ("lettre e" "e")
  ("lettre f" "f")
  ("lettre g" "g")
  ("lettre h" "h")
  ("lettre i" "i")
  ("lettre j" "j")
  ("lettre k" "k")
  ("lettre l" "l")
  ("lettre m" "m")
  ("lettre n" "n")
  ("lettre o" "o")
  ("lettre p" "p")
  ("lettre q" "q")
  ("lettre r" "r")
  ("lettre s" "s")
  ("lettre t" "t")
  ("lettre u" "u")
  ("lettre v" "v")
  ("lettre w" "w")
  ("lettre x" "x")
  ("lettre y" "y")
  ("lettre z" "z")

  ("majuscules" "majuscule")
  ("minuscules" "minuscule")
  ("la constante" "constante")

  ("rationnel" "rationnels")
  ("réel" "réels")
  ("entier" "entiers")
  ("le rationnel" "rationnels")
  ("le réel" "réels")
  ("les complexes" "complexes")
  ("les entiers positifs" "entiers positifs")
  ("les rationnels" "rationnels")
  ("les réels" "réels")
  ("les entiers" "entiers")
  ("nombres complexes" "complexes")
  ("nombres entiers positifs" "entiers positifs")
  ("nombres rationnels" "rationnels")
  ("nombres réels" "réels")
  ("nombres entiers" "entiers")

  ("parenthèse" "parenthèses")
  ("crochet" "crochets")
  ("accolade" "accolades")
  ("chevron" "chevrons")
  ("partie entière de" "partie entière")
  ("ensemble" "accolades")
  ("ensemble de" "accolades")
  ("ensemble des" "accolades")
  ("l'ensemble" "accolades")
  ("l'ensemble de" "accolades")
  ("l'ensemble des" "accolades")

  ("égal à" "égal")
  ("est égal à" "égal")

  ("pas égal" "non égal")
  ("pas égal à" "non égal")
  ("n'est pas égal à" "non égal")
  ("différent" "non égal")
  ("différent de" "non égal")
  ("est différent de" "non égal")

  ("plus petit" "inférieur")
  ("plus petit que" "inférieur")
  ("est plus petit" "inférieur")
  ("est plus petit que" "inférieur")
  ("est inférieur" "inférieur")
  ("inférieur à" "inférieur")
  ("inférieur ou égal" "inférieur égal")

  ("plus grand" "supérieur")
  ("plus grand que" "supérieur")
  ("est plus grand" "supérieur")
  ("est plus grand que" "supérieur")
  ("est supérieur" "supérieur")
  ("supérieur à" "supérieur")
  ("supérieur ou égal" "supérieur égal")

  ("est dans" "dans")
  ("sous ensemble de" "sous ensemble")
  ("un sous ensemble" "sous ensemble")
  ("est un sous ensemble" "sous ensemble")
  ("contient" "sur ensemble")
  ("vers" "flèche")

  ("il existe" "existe")
  ("existe un" "existe")
  ("si et seulement si" "équivaut")

  ("exp" "exponential")
  ("log" "logarithm")
  ("l'exponentielle de" "exponential of")
  ("le logarithme de" "logarithm of")
  ("le sinus de" "sine of")
  ("le cosinus de" "cosine of")
  ("la tangente de" "tangent of")
  ("la racine carrée de" "square root of")

  ("etc." "points")
  ("petits points" "points")
  ("point point point" "points")
  ("plus plus" "plus points plus")
  ("fois fois" "fois points fois")
  ("virgule virgule" "virgule points virgule")
  ("tenseur tenseur" "tenseur points tenseur")

  ("similaire à" "similaire")
  ("est similaire à" "similaire")
  ("équivalent" "similaire")
  ("équivalent à" "similaire")
  ("est équivalent" "similaire")
  ("est équivalent à" "similaire")
  ("asymptotique à" "asymptotique")
  ("est asymptotique à" "asymptotique")
  ("isomorphe à" "isomorphe")
  ("est isomorphe à" "isomorphe")
  
  ("négligeable devant" "négligeable")
  ("négligeable par rapport à" "négligeable")
  ("strictement dominé par" "négligeable")
  ("est strictement dominé par" "négligeable")
  ("dominé par" "dominé")
  ("est dominé par" "dominé")

  ("la somme" "somme")
  ("le produit" "produit")
  ("intégral" "intégrale")
  ("l'intégral" "intégrale")
  ("l'intégrale" "intégrale")
  ("l'infini" "infini")

  ("une" "un")
  ("égale" "égal")
  ("petite" "petit")
  ("petits" "petit")
  ("petites" "petit")
  ("grande" "grand")
  ("grands" "grand")
  ("grandes" "grand")
  ("inférieure" "inférieur")
  ("inférieurs" "inférieur")
  ("inférieures" "inférieur")
  ("supérieure" "supérieur")
  ("supérieurs" "supérieur")
  ("supérieures" "supérieur")
  ("équivalente" "équivalent")
  ("équivalents" "équivalent")
  ("équivalentes" "équivalent")
  ("dominée" "dominé")
  ("dominés" "dominé")
  ("dominées" "dominé")

  ("grand chapeau" "large chapeau")
  ("grand tilde" "large tilde")
  ("grand barre" "large barre")
  ("en dessous" "dessous")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adjust wrongly recognized words
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(speech-adjust french math
  ("à" "a")
  ("ah" "a")
  ("bae" "b")
  ("bébé" "b")
  ("ben" "b")
  ("c'est" "c")
  ("say" "c")
  ("day" "d")
  ("des" "d")
  ("œuf" "f")
  ("j'ai" "g")
  ("gay" "g")
  ("qu'à" "k")
  ("caca" "k")
  ("car" "k")
  ("casse" "k")
  ("j'y" "j")
  ("el" "l")
  ("elle" "l")
  ("aime" "m")
  ("haine" "n")
  ("and" "n")
  ("oh" "o")
  ("haut" "o")
  ("beau" "o")
  ("paye" "p")
  ("pays" "p")
  ("cul" "q")
  ("her" "r")
  ("air" "r")
  ("est-ce" "s")
  ("t'es" "t")
  ("stay" "t")
  ("tes" "t")
  ("eu" "u")
  ("vay" "v")
  ("value" "v")
  ("that" "z")

  ("bêta" "beta")
  ("bête un" "beta")
  ("gamin" "gamma")
  ("k ma" "gamma")
  ("za" "zeta")
  ("éteins" "eta")
  ("est un" "eta")
  ("est a" "eta")
  ("état" "eta")
  ("capa" "kappa")
  ("lakhdar" "lambda")
  ("lanta" "lambda")
  ("lampe ta" "lambda")
  ("lampe tard" "lambda")
  ("lampe torche" "lambda")
  ("mus" "mu")
  ("nue" "nu")
  ;;("si" "xi")
  ("haut microns" "omicron")
  ("pie" "pi")
  ("pis" "pi")
  ("pipi" "pi")
  ("rose" "rho")
  ("raux" "rho")
  ("row" "rho")
  ("chic ma" "sigma")
  ("to" "tau")
  ("toe" "tau")
  ("tôt" "tau")
  ("taux" "tau")
  ("tony" "tau")
  ("options" "upsilon")
  ("upside down" "upsilon")
  ("fille" "phi")
  ("fit" "phi")
  ("psy" "psi")
  ;;("si" "psi")
  ("qui" "chi")
  ("oméga" "omega")

  ("an" "a n")
  ("assez" "a c")
  ("constante dans une heure" "constante d'euler")
  ("constante de eyelar" "constante d'euler")

  ("sommes" "somme")
  ("au carré" "carré")
  ("est carré" "carré")
  ("chaos carré" "k carré")
  ("the contours" "de contour")

  ("bars" "barre")
  ("bar" "barre")
  ("bahr" "barre")
  ("var" "barre")
  ("chapo" "chapeau")
  ("chapeaux" "chapeau")
  ("quatre chapeau" "k chapeau")
  ("ou chapeau" "u chapeau")
  ("veille chapeau" "v chapeau")
  ("vieille chapeau" "v chapeau")
  ("six chapeau" "psi chapeau")
  ("bathilde" "b tilde")
  ("the tilde" "e tilde")
  ("ou tilde" "o tilde")
  ("est tilde" "s tilde")
  ("ti tilde" "t tilde")
  ("utile" "u tilde")
  ("utilité" "u tilde")
  ("veille tilde" "v tilde")
  ("vieille tilde" "v tilde")
  ("gars mathilde" "gamma tilde")
  ("ibar" "i barre")
  ("gibard" "j barre")
  ("khabar" "k barre")
  ("mbar" "m barre")
  ("au bar" "o barre")
  ("herbart" "r barre")
  ("esbart" "s barre")
  ("hubbard" "u barre")
  ("vieil bar" "w barre")
  ("lampe tabar" "lambda barre")
  ("bibar" "pi barre")
  ("bibard" "pi barre")
  ("tibar" "pi barre")
  ("tibard" "pi barre")
  ("pivar" "pi barre") 
  ("pivard" "pi barre")
  ("robar" "rho barre")
  ("robart" "rho barre")

  ("un 10" "indice")
  ("un dix" "indice")

  ("point horizontaux" "points horizontaux")
  ("point verticaux" "points verticaux")
  ("point diagonaux" "points diagonaux")
  ("point montant" "points montants")
  (". diagonaux" "points diagonaux")
  (". montant" "points montants")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Further, more dangerous adjustments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(speech-adjust french math
  ("puissance deux" "puissance d")
  ("six barre" "psi barre")
  )
