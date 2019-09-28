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

    "something ${{test = 3}}"
#   ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#    ^^^^^^^^^^ string.quoted.double.terraform
#              ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                ^ meta.interpolation.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
#                 ^^^^ meta.interpolation.terraform meta.braces.terraform entity.name.tag.terraform
#                      ^ meta.interpolation.terraform meta.braces.terraform keyword.operator.terraform
#                        ^ meta.interpolation.terraform meta.braces.terraform constant.numeric.integer.terraform
#                         ^ meta.interpolation.terraform meta.braces.terraform punctuation.section.braces.end.terraform
#                          ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                           ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

/////
// Includes tuples.
////

    "something ${[1, 2, 3]}"
#   ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#    ^^^^^^^^^^ string.quoted.double.terraform
#              ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#                ^ meta.interpolation.terraform punctuation.section.brackets.begin.terraform
#                 ^ meta.interpolation.terraform constant.numeric.integer.terraform
#                  ^ meta.interpolation.terraform punctuation.separator.terraform
#                    ^ meta.interpolation.terraform constant.numeric.integer.terraform
#                     ^ meta.interpolation.terraform punctuation.separator.terraform
#                       ^ meta.interpolation.terraform constant.numeric.integer.terraform
#                        ^ meta.interpolation.terraform punctuation.section.brackets.end.terraform
#                         ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                          ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

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

/////////////////////////////////////////////////////////////////////
// Brackets: Index Operations and Arrays
/////////////////////////////////////////////////////////////////////

/////
// Index Operations
/////

    thing[1]
#       ^ -punctuation 
#        ^ punctuation.section.brackets.begin.terraform
#         ^ constant.numeric.integer.terraform
#          ^ punctuation.section.brackets.end.terraform
#           ^ -punctuation

/////
// Arrays of literals
/////

    ["a", "b", "c"]
#   ^ punctuation.section.brackets.begin.terraform
#    ^ punctuation.definition.string.begin.terraform
#    ^^^ string.quoted.double.terraform
#      ^ punctuation.definition.string.end.terraform
#       ^ punctuation.separator.terraform
#         ^ punctuation.definition.string.begin.terraform
#         ^^^ string.quoted.double.terraform
#           ^ punctuation.definition.string.end.terraform
#            ^ punctuation.separator.terraform
#              ^ punctuation.definition.string.begin.terraform
#              ^^^ string.quoted.double.terraform
#                ^ punctuation.definition.string.end.terraform
#                 ^ punctuation.section.brackets.end.terraform

/////
// Allows inline comments
/////

    [1, /* inline */ 2]
#   ^ punctuation.section.brackets.begin.terraform
#    ^ constant.numeric.integer.terraform
#     ^ punctuation.separator.terraform
#       ^^ punctuation.definition.comment.terraform
#       ^^^^^^^^^^^^ comment.block.terraform
#                 ^^ punctuation.definition.comment.terraform
#                    ^ constant.numeric.integer.terraform
#                     ^ punctuation.section.brackets.end.terraform

/////
// Allows expression over multiple lines
/////

    [
#   ^ punctuation.section.brackets.begin.terraform
      1,
#     ^ constant.numeric.integer.terraform
#      ^ punctuation.separator.terraform
      2
#     ^ constant.numeric.integer.terraform
    ]
#   ^ punctuation.section.brackets.end.terraform

/////
// Allows operators
/////

    [ 1 + 2 ]
#   ^ punctuation.section.brackets.begin.terraform
#     ^ constant.numeric.integer.terraform
#       ^ keyword.operator.arithmetic.terraform
#         ^ constant.numeric.integer.terraform
#           ^ punctuation.section.brackets.end.terraform

/////
// Splat operator
/////

// TODO

/////
// Handle nested arrays
/////

// TODO

/////
// Attribute-access inside arrays
/////

// TODO

/////
// Includes functions.
/////

// TODO

/////
// Include objects.
/////

    [{a = 1}, {g = 2}]
#   ^ punctuation.section.brackets.begin.terraform
#    ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#     ^ meta.braces.terraform entity.name.tag.terraform
#       ^ meta.braces.terraform keyword.operator.terraform
#         ^ meta.braces.terraform constant.numeric.integer.terraform
#          ^ meta.braces.terraform punctuation.section.braces.end.terraform
#           ^ punctuation.separator.terraform
#             ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#              ^ meta.braces.terraform entity.name.tag.terraform
#                ^ meta.braces.terraform keyword.operator.terraform
#                  ^ meta.braces.terraform constant.numeric.integer.terraform
#                   ^ meta.braces.terraform punctuation.section.braces.end.terraform
#                    ^ punctuation.section.brackets.end.terraform 

/////
// Includes named values
/////

// TODO

/////////////////////////////////////////////////////////////////////
// Collections: Objects
/////////////////////////////////////////////////////////////////////

/////
// Key/value pairs separated by newlines.
/////

    {
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
      name = "John"
#     ^^^^ meta.braces.terraform entity.name.tag.terraform
#          ^ meta.braces.terraform keyword.operator.terraform
#            ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#             ^^^^^ meta.braces.terraform string.quoted.double.terraform
      age = 52
#     ^^^ meta.braces.terraform entity.name.tag.terraform
#         ^ meta.braces.terraform keyword.operator.terraform
#           ^^ meta.braces.terraform constant.numeric.integer.terraform
    }
#   ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////
// Key/value pairs separated by commas.
/////

    {name = "John", age = 52}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^^^^ meta.braces.terraform entity.name.tag.terraform
#         ^ meta.braces.terraform keyword.operator.terraform
#           ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#            ^^^^^ meta.braces.terraform string.quoted.double.terraform
#                 ^ meta.braces.terraform punctuation.separator.terraform
#                           ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////
// Allows operators in key values.
/////

    { name = 1 + 1 }
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#     ^^^^ meta.braces.terraform entity.name.tag.terraform
#          ^ meta.braces.terraform keyword.operator.terraform
#            ^ meta.braces.terraform constant.numeric.integer.terraform
#              ^ meta.braces.terraform keyword.operator.arithmetic.terraform
#                ^ meta.braces.terraform constant.numeric.integer.terraform
#                  ^ meta.braces.terraform punctuation.section.braces.end.terraform
#                   ^ -meta

/////
// Allows tuples as key values.
/////

    { list = [ 1, 2, 3 ]}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#     ^^^^ meta.braces.terraform entity.name.tag.terraform
#          ^ meta.braces.terraform keyword.operator.terraform
#            ^ meta.braces.terraform punctuation.section.brackets.begin.terraform
#              ^ meta.braces.terraform constant.numeric.integer.terraform
#               ^ meta.braces.terraform punctuation.separator.terraform
#                 ^ meta.braces.terraform constant.numeric.integer.terraform
#                  ^ meta.braces.terraform punctuation.separator.terraform
#                    ^ meta.braces.terraform constant.numeric.integer.terraform
#                      ^ meta.braces.terraform punctuation.section.brackets.end.terraform
#                       ^ meta.braces.terraform punctuation.section.braces.end.terraform
#                        ^ -meta

/////
// Allows function calls as keys.
/////

// TODO

/////
// Allows nested collection literals.
/////

    {
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
      obj1 = {
#     ^^^^ meta.braces.terraform entity.name.tag.terraform
#          ^ meta.braces.terraform keyword.operator.terraform
#            ^ meta.braces.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
        obj2 = {
#       ^^^^ meta.braces.terraform meta.braces.terraform entity.name.tag.terraform
#            ^ meta.braces.terraform meta.braces.terraform keyword.operator.terraform
#              ^ meta.braces.terraform meta.braces.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
          value = 5
#         ^^^^^ meta.braces.terraform meta.braces.terraform meta.braces.terraform entity.name.tag.terraform
#               ^ meta.braces.terraform meta.braces.terraform meta.braces.terraform keyword.operator.terraform
#                 ^ meta.braces.terraform meta.braces.terraform meta.braces.terraform constant.numeric.integer.terraform
        }
#       ^ meta.braces.terraform meta.braces.terraform meta.braces.terraform punctuation.section.braces.end.terraform
      }
#     ^ meta.braces.terraform meta.braces.terraform punctuation.section.braces.end.terraform
    }
#   ^ meta.braces.terraform punctuation.section.braces.end.terraform
#    ^ -meta

/////
// Allows attribute-access as rvalue, including named values.
/////

// TODO

/////
// Allows strings as keys.
/////

    {"gggg" = "gggg"}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#     ^^^^ meta.braces.terraform string.quoted.double.terraform
#         ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#           ^ meta.braces.terraform keyword.operator.terraform
#             ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#              ^^^^ meta.braces.terraform string.quoted.double.terraform
#                  ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#                   ^ meta.braces.terraform punctuation.section.braces.end.terraform


/////
// Allows expressions + operators as keys.
/////

    {(1 + 2) = "gggg"}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^ meta.braces.terraform punctuation.section.parens.begin.terraform
#     ^ meta.braces.terraform constant.numeric.integer.terraform
#       ^ meta.braces.terraform keyword.operator.arithmetic.terraform
#         ^ meta.braces.terraform constant.numeric.integer.terraform
#          ^ meta.braces.terraform punctuation.section.parens.end.terraform
#            ^ meta.braces.terraform keyword.operator.terraform
#              ^ meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#               ^^^^^ meta.braces.terraform string.quoted.double.terraform
#                    ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////
// Allows function calls as keys.
/////

// TODO

/////
// Allows attribute-access as keys.
////

// TODO

