# SYNTAX TEST "Terraform.tmLanguage"

/////////////////////////////////////////////////////////////////////
// INLINE COMMENTS
/////////////////////////////////////////////////////////////////////

/////
// Start of line inline comments with `#`.
/////

# inline comment
# ^ source.terraform comment.line.terraform

/////
// Start of line inline comments with `//`.
/////

// foo
# ^ source.terraform comment.line.terraform

/////
// Matches at random place in line + punctuation for `#`.
/////

        # bar
#     ^ -comment -punctuation
#       ^ punctuation.definition.comment.terraform
#       ^^^^^ comment.line.terraform

/////
// Matches at random place in line + punctuation for `//`.
/////

    // baz # blah
# ^ -comment -punctuation
#   ^^ punctuation.definition.comment.terraform
#   ^^^^^^^^^^^^^ comment.line.terraform

/////////////////////////////////////////////////////////////////////
// BLOCK COMMENTS
/////////////////////////////////////////////////////////////////////

/////
// Matches for a single line.
/////

    /* foo */
# ^ -comment -punctuation
#   ^^ punctuation.definition.comment.terraform
#   ^^^^^^^^ comment.block.terraform
#          ^^ punctuation.definition.comment.terraform

/////
// Matches over multiple lines.
/////

    /*
# ^ -comment -punctuation
#   ^^ punctuation.definition.comment.terraform
#   ^^^^ comment.block.terraform

  foo
# ^^^^ comment.block.terraform

    */
# ^^^^ comment.block.terraform
#   ^^ punctuation.definition.comment.terraform

/////
// Matches inline comments after block ends.
/////

     /* comment */    // inline
# ^ -comment -punctuation
#    ^^ punctuation.definition.comment.terraform
#    ^^^^^^^^^^^^ comment.block.terraform
#               ^^ punctuation.definition.comment.terraform
#                 ^^^ -comment -punctuation
#                     ^^ punctuation.definition.comment.terraform
#                     ^^^^^^^^ comment.line.terraform

/////////////////////////////////////////////////////////////////////
// LANGUAGE CONSTANTS
/////////////////////////////////////////////////////////////////////

/////
// Matches `true`.
/////

    true
# ^ -constant
#   ^^^^ constant.language.terraform
#         ^ -constant

/////
// Matches `false`.
/////

    false
# ^ -constant
#   ^^^^^ constant.language.terraform
#         ^ -constant


/////
// Matches `null`.
/////

    null
# ^ -constant
#   ^^^^ constant.language.terraform
#         ^ -constant

/////////////////////////////////////////////////////////////////////
// INTEGER CONSTANTS
/////////////////////////////////////////////////////////////////////

/////
// Matches integers.
/////

    444
# ^ -constant -numeric
#   ^^^ constant.numeric.integer.terraform

/////
// Matches zero.
/////

      0
# ^ -constant -numeric
#     ^ constant.numeric.integer.terraform

/////
// Matches one.
/////

      1
# ^ -constant -numeric
#     ^ constant.numeric.integer.terraform

/////
// Matches large integers.
/////

      26345645634561
# ^ -constant -numeric
#     ^^^^^^^^^^^^^^ constant.numeric.integer.terraform

/////////////////////////////////////////////////////////////////////
// FLOATING-POINT CONSTANTS
/////////////////////////////////////////////////////////////////////

/////
// Matches floating-point numbers.
/////

      1.2
# ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.decimal.terraform
#       ^ constant.numeric.float.terraform

/////
// Matches large floating-point numbers.
/////

      61.28888888888
#   ^ -constant -numeric
#     ^^ constant.numeric.float.terraform
#       ^ punctuation.separator.decimal.terraform
#        ^^^^^^^^^^^ constant.numeric.float.terraform

/////
// Matches integers with exponents.
/////

      1e12
#   ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.exponent.terraform
#       ^^ constant.numeric.float.terraform

/////
// Matches floats with exponents.
/////

      1.4E12
#   ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.decimal.terraform
#       ^ constant.numeric.float.terraform
#        ^ punctuation.separator.exponent.terraform
#         ^^ constant.numeric.float.terraform

/////
// Matches floats with postive signed exponents.
/////

      1.4e+12
#   ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.decimal.terraform
#       ^ constant.numeric.float.terraform
#        ^^ punctuation.separator.exponent.terraform
#          ^^ constant.numeric.float.terraform

/////
// Matches floats with negative signed exponents.
/////

      1.4E-12
#   ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.decimal.terraform
#       ^ constant.numeric.float.terraform
#        ^^ punctuation.separator.exponent.terraform
#          ^^ constant.numeric.float.terraform

/////////////////////////////////////////////////////////////////////
// STRINGS
/////////////////////////////////////////////////////////////////////

/////
// Matches punctuation and assigns meta_scope.
/////

      "a string"
#   ^ -punctuation -string
#     ^ punctuation.definition.string.begin.terraform
#     ^^^^^^^^^^ string.quoted.double.terraform
#              ^ punctuation.definition.string.end.terraform
#                 ^ -punctuation -string

/////
// Matches character escapes.
/////

      "a \n b \r c \t d \" e \udead f \udeadbeef"
#   ^ -punctuation -string
#     ^ punctuation.definition.string.begin.terraform
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.terraform
#        ^^ constant.character.escape.terraform
#             ^^ constant.character.escape.terraform
#                  ^^ constant.character.escape.terraform
#                       ^^ constant.character.escape.terraform
#                            ^^^^^ constant.character.escape.terraform
#                                     ^^^^^^^^^^ constant.character.escape.terraform
#                                               ^ punctuation.definition.string.end.terraform

/////////////////////////////////////////////////////////////////////
// STRING INTERPOLATION
/////////////////////////////////////////////////////////////////////

/////
// Correct scopes during interpolation.
/////

      "some ${interpolation} string"
#   ^ -punctuation -string
#     ^ punctuation.definition.string.begin.terraform
#      ^^^^^ string.quoted.double.terraform
#           ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#             ^^^^^^^^^^^^^^ meta.interpolation.terraform
#                          ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                            ^^^^^^^ string.quoted.double.terraform
#                                  ^ punctuation.definition.string.end.terraform
#                                   ^ -punctuation -string

/////
// Matches left-trim and right-trim.
/////

      "%{~ fff ~}"
#     ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#      ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#        ^^ meta.interpolation.terraform keyword.operator.template.left.trim.terraform
#          ^^^^^^ meta.interpolation.terraform
#             ^^ meta.interpolation.terraform keyword.operator.template.right.trim.terraform
#               ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

/////
// Matches operators
/////

    "${ something ? true : false }"
#   ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#    ^^ punctuation.section.interpolation.begin.terraform
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform
#                 ^ keyword.operator.terraform
#                   ^^^^ meta.interpolation.terraform constant.language.terraform
#                        ^ meta.interpolation.terraform keyword.operator.terraform
#                          ^^^^^ meta.interpolation.terraform constant.language.terraform
#                                ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                 ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

/////
// Dot-access attributes in string interpolation
/////

// TODO

/////
// Handles function calls
/////

// TODO

/////
// Includes objects.
////

// TODO

/////
// Includes tuples.
////

// TODO

/////
// Includes named values.
/////

// TODO

/////////////////////////////////////////////////////////////////////
// Template If Directives
/////////////////////////////////////////////////////////////////////

/////
// Matches if/endif directives.
/////

      "${ if name == "Mary" }${name}${ endif ~}"
#    ^ -string -punctuation
#     ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#      ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform
#         ^^ meta.interpolation.terraform keyword.control.terraform
#                 ^^ meta.interpolation.terraform keyword.operator.terraform
#                    ^ source.terraform meta.interpolation.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                    ^^^^^^ source.terraform meta.interpolation.terraform string.quoted.double.terraform
#                         ^ source.terraform meta.interpolation.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#                           ^ punctuation.section.interpolation.end.terraform
#                            ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                  ^ punctuation.section.interpolation.end.terraform 
#                                   ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                      ^^^^^ meta.interpolation.terraform keyword.control.terraform
#                                            ^ meta.interpolation.terraform keyword.operator.template.right.trim.terraform
#                                             ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                              ^ string.quoted.double.terraform punctuation.definition.string.end.terraform
#                                               ^ -string -punctuation

/////
// Matches if/else/endif directives.
/////

      "%{ if name == "Mary" }${name}%{ else }${ "Mary" }%{ endif ~}"
#    ^ -string -punctuation
#     ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#      ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform
#         ^^ meta.interpolation.terraform keyword.control.terraform
#                 ^^ meta.interpolation.terraform keyword.operator.terraform
#                    ^ source.terraform meta.interpolation.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                    ^^^^^^ source.terraform meta.interpolation.terraform string.quoted.double.terraform
#                         ^ source.terraform meta.interpolation.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#                           ^ punctuation.section.interpolation.end.terraform
#                            ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                  ^ punctuation.section.interpolation.end.terraform 
#                                   ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                      ^^^^ meta.interpolation.terraform keyword.control.terraform
#                                           ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                            ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                               ^ meta.interpolation.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                                                ^^^^^ meta.interpolation.terraform string.quoted.double.terraform
#                                                      ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                                      ^ punctuation.section.interpolation.end.terraform
#                                                       ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                                                          ^^^^^ meta.interpolation.terraform keyword.control.terraform
#                                                                ^ meta.interpolation.terraform keyword.operator.template.right.trim.terraform
#                                                                 ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                                                  ^ string.quoted.double.terraform punctuation.definition.string.end.terraform
#                                                                   ^ -string -punctuation

/////
// Matches for/in/endfor directives.
/////

// TODO

/////////////////////////////////////////////////////////////////////
// Operators
/////////////////////////////////////////////////////////////////////

/////
// Comparison
/////

    a == b
#   ^ -keyword -operator
#     ^^ keyword.operator.terraform
#         ^ -keyword -operator 

    a != b
#   ^ -keyword -operator
#     ^^ keyword.operator.terraform
#         ^ -keyword -operator 

    a < b
#    ^ -keyword -operator
#     ^ keyword.operator.terraform
#      ^ -keyword -operator

    a <= b
#    ^ -keyword -operator
#     ^^ keyword.operator.terraform
#       ^ -keyword -operator

    a > b
#    ^ -keyword -operator 
#     ^ keyword.operator.terraform
#      ^ -keyword -operator

    a >= b
#    ^ -keyword -operator
#     ^^ keyword.operator.terraform
#       ^ -keyword -operator

/////
// Arithmetic
/////

    a + b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    a - b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    a * b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    a / b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    a % b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    -a
#  ^ -keyword -operator
#   ^ keyword.operator.arithmetic.terraform 
#    ^ -keyword -operator 

/////
// Logic
/////

    a && b
#   ^^ -keyword -operator
#     ^^ keyword.operator.logical.terraform
#       ^^ -keyword -operator

    a || b
#   ^^ -keyword -operator
#     ^^ keyword.operator.logical.terraform
#       ^^ -keyword -operator

    !a
# ^^ -keyword -operator
#   ^ keyword.operator.logical.terraform
#    ^^ -keyword -operator

/////
// Conditional
/////

// TODO

/////
// Ellipsis
/////

// TODO