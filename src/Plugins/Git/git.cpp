
/******************************************************************************
 * MODULE     : git.cpp
 * DESCRIPTION: Interface with Git
 * COPYRIGHT  : (C) 2024    Darcy Shen
 *******************************************************************************
 * This software falls under the GNU general public license version 3 or later.
 * It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
 * in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
 ******************************************************************************/

#include "git.hpp"

string
libgit2_version() {
    return string (LIBGIT2_VERSION);
}
