
/******************************************************************************
* MODULE     : tree_label.hpp
* DESCRIPTION: labels of trees
* COPYRIGHT  : (C) 1999  Joris van der Hoeven
*******************************************************************************
* This software falls under the GNU general public license and comes WITHOUT
* ANY WARRANTY WHATSOEVER. See the file $TEXMACS_PATH/LICENSE for more details.
* If you don't have this file, write to the Free Software Foundation, Inc.,
* 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
******************************************************************************/

#ifndef TREE_LABEL_H
#define TREE_LABEL_H
#include "string.hpp"

/******************************************************************************
* Standard tree labels
******************************************************************************/

enum tree_label {
  STRING, UNKNOWN, UNINIT, ERROR, RAW_DATA,
  DOCUMENT, PARAGRAPH, SURROUND, CONCAT, FORMAT,
  HSPACE, VSPACE_BEFORE, VSPACE_AFTER, SPACE,
  HTAB, SPLIT, MOVE, RESIZE, REPEAT, _FLOAT,
  DECORATE_ATOMS, DECORATE_LINES, DECORATE_PAGES, DECORATED_BOX,

  WITH_LIMITS, LINE_BREAK, NEW_LINE, LINE_SEP, NEXT_LINE,
  NO_BREAK, YES_FIRST_INDENT, NO_FIRST_INDENT, YES_FIRST_INDENT_AFTER,
  NO_FIRST_INDENT_AFTER, PAGE_BREAK_BEFORE, PAGE_BREAK,
  NO_PAGE_BREAK_BEFORE, NO_PAGE_BREAK_AFTER, NEW_PAGE_BEFORE,
  NEW_PAGE, NEW_DOUBLE_PAGE_BEFORE, NEW_DOUBLE_PAGE,
  // modify is_formatting predicate when inserting new tags

  GROUP, LEFT, MIDDLE, RIGHT, BIG,
  LEFT_PRIME, RIGHT_PRIME, BELOW, ABOVE,
  LEFT_SUB, LEFT_SUP, RIGHT_SUB, RIGHT_SUP,
  FRAC, SQRT, WIDE, WIDE_UNDER, NEG, TREE,
  OLD_MATRIX, OLD_TABLE, OLD_MOSAIC, OLD_MOSAIC_ITEM,

  TABLE_FORMAT, TABLE_WITH, CELL_WITH, TABLE_MARKER,
  TABLE, ROW, CELL, SUB_TABLE,

  ASSIGN, WITH, SET, RESET,
  EXPAND, VAR_EXPAND, HIDE_EXPAND,
  APPLY, BEGIN, END, INCLUDE,
  MACRO, FUNCTION, ENVIRONMENT, DRD_PROPS,
  EVAL, PROVIDES, VALUE, ARGUMENT,
  BACKUP, QUOTE, DELAY, HOLD, RELEASE,

  OR, XOR, AND, NOT,
  PLUS, MINUS, TIMES, OVER, DIVIDE, MODULO,
  MERGE, LENGTH, RANGE, NUMBER, _DATE, TRANSLATE, FIND_FILE,
  IS_TUPLE, LOOK_UP,
  EQUAL, UNEQUAL, LESS, LESSEQ, GREATER, GREATEREQ,
  IF, VAR_IF, CASE, WHILE,
  EXTERN, AUTHORIZE,

  INACTIVE, ACTIVE, VAR_INACTIVE, VAR_ACTIVE,
  SYMBOL, LATEX, HYBRID,
  TUPLE, ATTR, COLLECTION, ASSOCIATE,
  LABEL, REFERENCE, PAGEREF, WRITE,
  SPECIFIC, HYPERLINK, ACTION,
  TAG, MEANING,

  GRAPHICS, SUPERPOSE, TEXT_AT, _POINT,
  LINE, CLINE, SPLINE, VAR_SPLINE, CSPLINE,
  FILL, POSTSCRIPT,

  START_EXTENSIONS
};

inline tree_label SUB (bool right) { return right? RIGHT_SUB: LEFT_SUB; }
inline tree_label SUP (bool right) { return right? RIGHT_SUP: LEFT_SUP; }

/******************************************************************************
* Conversions from tree_labels to strings and vice versa
******************************************************************************/

void make_tree_label (tree_label l, string s);
tree_label make_tree_label (string s); // for extensions
string as_string (tree_label l);
tree_label as_tree_label (string s);

#endif // defined TREE_LABEL_H
