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

    "hello ${aws_instance.ubuntu}"
#   ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#   ^^^^^^^ string.quoted.double.terraform
#          ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#            ^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform
#                        ^ meta.interpolation.terraform punctuation.accessor.dot.terraform
#                         ^^^^^^ meta.interpolation.terraform variable.other.member.terraform
#                               ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

/////
// Handles function calls
/////

      "${formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")}"
#     ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#      ^^ meta.interpolation.terraform punctuation.section.interpolation.begin.terraform
#        ^^^^^^^^^^ meta.interpolation.terraform meta.function-call.terraform support.function.builtin.terraform
#                  ^ meta.interpolation.terraform meta.function-call.terraform punctuation.section.parens.begin.terraform
#                   ^ meta.interpolation.terraform meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                    ^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform meta.function-call.terraform string.quoted.double.terraform
#                                          ^ meta.interpolation.terraform meta.function-call.terraform punctuation.separator.terraform
#                                            ^ meta.interpolation.terraform meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                                             ^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.terraform meta.function-call.terraform string.quoted.double.terraform
#                                                                  ^ meta.interpolation.terraform meta.function-call.terraform punctuation.section.parens.end.terraform
#                                                                   ^ meta.interpolation.terraform punctuation.section.interpolation.end.terraform
#                                                                    ^ string.quoted.double.terraform punctuation.definition.string.end.terraform

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

    length(some_list) > 0 ? some_list[0] : default
#   ^^^^^^ meta.function-call.terraform support.function.builtin.terraform
#         ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#          ^^^^^^^^^ meta.function-call.terraform variable.parameter.terraform
#                   ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                     ^ keyword.operator.terraform
#                       ^ constant.numeric.integer.terraform
#                         ^ keyword.operator.terraform
#                                    ^ punctuation.section.brackets.begin.terraform
#                                     ^ constant.numeric.integer.terraform
#                                      ^ punctuation.section.brackets.end.terraform
#                                        ^ keyword.operator.terraform

/////
// Ellipsis
/////

    hhh([55, 2453, 2]...)
#   ^^^ meta.function-call.terraform variable.function.terraform
#      ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#       ^ punctuation.section.brackets.begin.terraform
#        ^^ constant.numeric.integer.terraform
#          ^ punctuation.separator.terraform
#            ^^^^ constant.numeric.integer.terraform
#                ^ punctuation.separator.terraform
#                  ^ constant.numeric.integer.terraform
#                   ^ punctuation.section.brackets.end.terraform
#                    ^^^ keyword.operator.terraform 
#                       ^ meta.function-call.terraform punctuation.section.parens.end.terraform

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

    tuple[*].foo.bar[0]
#        ^ punctuation.section.brackets.begin.terraform
#         ^ punctuation.section.brackets.end.terraform keyword.operator.splat.terraform
#          ^ punctuation.section.brackets.end.terraform
#           ^ punctuation.accessor.dot.terraform
#            ^^^ variable.other.member.terraform
#               ^ punctuation.accessor.dot.terraform
#                ^^^ variable.other.member.terraform
#                   ^ punctuation.section.brackets.begin.terraform
#                    ^ constant.numeric.integer.terraform
#                     ^ punctuation.section.brackets.end.terraform

/////
// Handle nested arrays
/////

    count = [
#   ^^^^^ variable.declaration.terraform variable.other.readwrite.terraform
#         ^^ variable.declaration.terraform keyword.operator.assignment.terraform
#           ^ punctuation.section.brackets.begin.terraform
      [ 1, 2],
#     ^ punctuation.section.brackets.begin.terraform
#       ^ constant.numeric.integer.terraform
#        ^ punctuation.separator.terraform
#          ^ constant.numeric.integer.terraform
#           ^ punctuation.section.brackets.end.terraform
#            ^ punctuation.separator.terraform
      [ 6, 7]
#     ^ punctuation.section.brackets.begin.terraform
#       ^ constant.numeric.integer.terraform
#        ^ punctuation.separator.terraform
#          ^ constant.numeric.integer.terraform
#           ^ punctuation.section.brackets.end.terraform
    ]
#   ^ punctuation.section.brackets.end.terraform
#    ^ -punctuation

/////
// Attribute-access inside arrays
/////

    [ aws_instance.ubuntu, aws_instance.freebsd ]
#   ^ punctuation.section.brackets.begin.terraform
#                 ^ punctuation.accessor.dot.terraform
#                  ^^^^^^ variable.other.member.terraform
#                        ^ punctuation.separator.terraform
#                                      ^ punctuation.accessor.dot.terraform
#                                       ^^^^^^^ variable.other.member.terraform
#                                               ^ punctuation.section.brackets.end.terraform

/////
// Includes functions.
/////

    [ upper("ggh") ]
#   ^ punctuation.section.brackets.begin.terraform
#     ^^^^^ meta.function-call.terraform support.function.builtin.terraform
#          ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#           ^ meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#            ^^^^ meta.function-call.terraform string.quoted.double.terraform
#                ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                  ^ punctuation.section.brackets.end.terraform

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
// Allows function calls as values.
/////

    {
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
      a = upper("l"),
#     ^ meta.braces.terraform entity.name.tag.terraform
#       ^ meta.braces.terraform keyword.operator.terraform
#         ^^^^^ meta.braces.terraform meta.function-call.terraform support.function.builtin.terraform
#              ^ meta.braces.terraform meta.function-call.terraform punctuation.section.parens.begin.terraform
#               ^ meta.braces.terraform meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                ^^ meta.braces.terraform meta.function-call.terraform string.quoted.double.terraform
#                  ^ meta.braces.terraform meta.function-call.terraform punctuation.section.parens.end.terraform
#                   ^ meta.braces.terraform punctuation.separator.terraform
    }
#   ^ meta.braces.terraform punctuation.section.braces.end.terraform

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

    {(func()) = 1}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^ meta.braces.terraform punctuation.section.parens.begin.terraform
#     ^^^^ meta.braces.terraform meta.function-call.terraform variable.function.terraform
#         ^ meta.braces.terraform meta.function-call.terraform punctuation.section.parens.begin.terraform
#          ^ meta.braces.terraform meta.function-call.terraform punctuation.section.parens.end.terraform
#           ^ meta.braces.terraform punctuation.section.parens.end.terraform
#             ^ meta.braces.terraform keyword.operator.terraform
#               ^ meta.braces.terraform constant.numeric.integer.terraform
#                ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////
// Allows attribute-access as keys.
////

// TODO

/////////////////////////////////////////////////////////////////////
// Attribute Access
/////////////////////////////////////////////////////////////////////

/////
// Matches dot-access
/////

    aws_instance.ubuntu[*].private_dns
#               ^ punctuation.accessor.dot.terraform
#                ^^^^^^ variable.other.member.terraform
#                      ^ punctuation.section.brackets.begin.terraform
#                       ^ punctuation.section.brackets.end.terraform keyword.operator.splat.terraform
#                        ^ punctuation.section.brackets.end.terraform
#                         ^ punctuation.accessor.dot.terraform
#                          ^^^^^^^^^^^ variable.other.member.terraform
#                                     ^ -variable -punctuation 

/////
// Ignores dot-access in string literals
/////

    "aws_instance.ubuntu"
#   ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                ^ -variable
#   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.terraform

/////
// Matches inside for-expressions
/////

// TODO

/////
// Attribute-only splat
/////

    tuple.*.foo.bar[0]
#        ^ punctuation.accessor.dot.terraform
#         ^ keyword.operator.splat.terraform
#          ^ punctuation.accessor.dot.terraform
#           ^^^ variable.other.member.terraform
#              ^ punctuation.accessor.dot.terraform
#               ^^^ variable.other.member.terraform
#                  ^ punctuation.section.brackets.begin.terraform
#                   ^ constant.numeric.integer.terraform
#                    ^ punctuation.section.brackets.end.terraform

/////////////////////////////////////////////////////////////////////
// Attribute Definition
/////////////////////////////////////////////////////////////////////

/////
// Basic definition
/////

// TODO

/////
// Populate an attribute from a variable value
/////

    (foo) = "baz"
#   ^ variable.declaration.terraform punctuation.section.parens.begin.terraform
#    ^^^ variable.declaration.terraform variable.other.readwrite.terraform
#       ^ variable.declaration.terraform punctuation.section.parens.end.terraform
#         ^ variable.declaration.terraform keyword.operator.assignment.terraform
#           ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#           ^^^^^ string.quoted.double.terraform
#               ^ string.quoted.double.terraform punctuation.definition.string.end.terraform 

/////////////////////////////////////////////////////////////////////
// Function Calls
/////////////////////////////////////////////////////////////////////

/////
// Basic call.
/////

    thing(l)
#   ^^^^^ meta.function-call.terraform variable.function.terraform
#        ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#         ^ meta.function-call.terraform variable.parameter.terraform
#          ^ meta.function-call.terraform punctuation.section.parens.end.terraform

/////
// Matches parameters, attribute-access, literals, operators, commas.
/////

    cidrthingy(aws_vpc.main.cidr_block, 4, count.index+1)
#   ^^^^^^^^^^ meta.function-call.terraform variable.function.terraform
#             ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#              ^^^^^^^ meta.function-call.terraform variable.parameter.terraform
#                     ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                      ^^^^ meta.function-call.terraform variable.other.member.terraform
#                          ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                           ^^^^^^^^^^ meta.function-call.terraform variable.other.member.terraform
#                                     ^ meta.function-call.terraform punctuation.separator.terraform
#                                       ^ meta.function-call.terraform constant.numeric.integer.terraform
#                                        ^ meta.function-call.terraform punctuation.separator.terraform
#                                          ^^^^^ meta.function-call.terraform variable.parameter.terraform
#                                               ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                                                ^^^^^ meta.function-call.terraform variable.other.member.terraform
#                                                     ^ meta.function-call.terraform keyword.operator.arithmetic.terraform
#                                                      ^ meta.function-call.terraform constant.numeric.integer.terraform
#                                                       ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                                                        ^ -meta -function-call -variable

/////
// Matches arrays and splat as parameters.
/////

      y6y([55, 2453, 2]..., [55555555])
#     ^^^ meta.function-call.terraform variable.function.terraform
#        ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#         ^ meta.function-call.terraform punctuation.section.brackets.begin.terraform
#          ^^ meta.function-call.terraform constant.numeric.integer.terraform
#            ^ meta.function-call.terraform punctuation.separator.terraform
#              ^^^^ meta.function-call.terraform constant.numeric.integer.terraform
#                  ^ meta.function-call.terraform punctuation.separator.terraform
#                    ^ meta.function-call.terraform constant.numeric.integer.terraform
#                     ^ meta.function-call.terraform punctuation.section.brackets.end.terraform
#                      ^^^ meta.function-call.terraform keyword.operator.terraform
#                         ^ meta.function-call.terraform punctuation.separator.terraform
#                           ^ meta.function-call.terraform punctuation.section.brackets.begin.terraform
#                            ^^^^^^^^ meta.function-call.terraform constant.numeric.integer.terraform
#                                    ^ meta.function-call.terraform punctuation.section.brackets.end.terraform
#                                     ^ meta.function-call.terraform punctuation.section.parens.end.terraform

/////
// Matches objects as parameters.
/////

    some({a = 1, b = "2"})
#   ^^^^ meta.function-call.terraform variable.function.terraform
#       ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#        ^ meta.function-call.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
#         ^ meta.function-call.terraform meta.braces.terraform entity.name.tag.terraform
#           ^ meta.function-call.terraform meta.braces.terraform keyword.operator.terraform
#             ^ meta.function-call.terraform meta.braces.terraform constant.numeric.integer.terraform
#              ^ meta.function-call.terraform meta.braces.terraform punctuation.separator.terraform
#                ^ meta.function-call.terraform meta.braces.terraform entity.name.tag.terraform
#                  ^ meta.function-call.terraform meta.braces.terraform keyword.operator.terraform
#                    ^ meta.function-call.terraform meta.braces.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                     ^^ meta.function-call.terraform meta.braces.terraform string.quoted.double.terraform
#                       ^ meta.function-call.terraform meta.braces.terraform punctuation.section.braces.end.terraform
#                        ^ meta.function-call.terraform punctuation.section.parens.end.terraform 

/////
// Nested function calls.
/////

    func(thing(yep(1)))
#   ^^^^ meta.function-call.terraform variable.function.terraform
#       ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#        ^^^^^ meta.function-call.terraform meta.function-call.terraform variable.function.terraform
#             ^ meta.function-call.terraform meta.function-call.terraform punctuation.section.parens.begin.terraform
#              ^^^ meta.function-call.terraform meta.function-call.terraform meta.function-call.terraform variable.function.terraform
#                 ^ meta.function-call.terraform meta.function-call.terraform meta.function-call.terraform punctuation.section.parens.begin.terraform
#                  ^ meta.function-call.terraform meta.function-call.terraform meta.function-call.terraform constant.numeric.integer.terraform
#                   ^ meta.function-call.terraform meta.function-call.terraform meta.function-call.terraform punctuation.section.parens.end.terraform
#                    ^ meta.function-call.terraform meta.function-call.terraform punctuation.section.parens.end.terraform
#                     ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                      ^ -function

/////
// Parameters spanning multiple lines.
/////

    func(
#   ^^^^ meta.function-call.terraform variable.function.terraform
#       ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
      1,
#     ^ meta.function-call.terraform constant.numeric.integer.terraform
#      ^ meta.function-call.terraform punctuation.separator.terraform
      2
#     ^ meta.function-call.terraform constant.numeric.integer.terraform
    )
#   ^ meta.function-call.terraform punctuation.section.parens.end.terraform

/////
// Allow object for-expressions.
////

    thing({for i, v in ["a"]: v => i...})
#   ^^^^^ meta.function-call.terraform variable.function.terraform
#        ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#         ^ meta.function-call.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
#          ^^^ meta.function-call.terraform meta.braces.terraform keyword.control.terraform
#              ^ meta.function-call.terraform variable.other.readwrite.terraform
#               ^ meta.function-call.terraform punctuation.separator.terraform
#                 ^ meta.function-call.terraform variable.other.readwrite.terraform
#                   ^^ meta.function-call.terraform keyword.operator.word.terraform
#                      ^ meta.function-call.terraform punctuation.section.brackets.begin.terraform
#                       ^ meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                        ^^ meta.function-call.terraform string.quoted.double.terraform
#                          ^ meta.function-call.terraform punctuation.section.brackets.end.terraform
#                           ^ meta.function-call.terraform keyword.operator.terraform
#                             ^ meta.function-call.terraform variable.other.readwrite.terraform
#                               ^^ meta.function-call.terraform storage.type.function.terraform
#                                  ^ meta.function-call.terraform variable.other.readwrite.terraform
#                                   ^^^ meta.function-call.terraform keyword.operator.terraform
#                                      ^ meta.function-call.terraform punctuation.section.braces.end.terraform
#                                       ^ meta.function-call.terraform punctuation.section.parens.end.terraform

/////
// Allow tuple for-expressions.
/////

    func([for v in ["a", "b"]: v])
#   ^^^^ meta.function-call.terraform variable.function.terraform
#       ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#        ^ meta.function-call.terraform punctuation.section.brackets.begin.terraform
#         ^^^ meta.function-call.terraform keyword.control.terraform
#             ^ meta.function-call.terraform variable.other.readwrite.terraform
#               ^^ meta.function-call.terraform keyword.operator.word.terraform
#                  ^ meta.function-call.terraform punctuation.section.brackets.begin.terraform
#                   ^ meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                    ^^ meta.function-call.terraform string.quoted.double.terraform
#                      ^ meta.function-call.terraform punctuation.separator.terraform
#                        ^ meta.function-call.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                         ^^ meta.function-call.terraform string.quoted.double.terraform
#                           ^ meta.function-call.terraform punctuation.section.brackets.end.terraform
#                            ^ meta.function-call.terraform keyword.operator.terraform
#                              ^ meta.function-call.terraform variable.other.readwrite.terraform
#                               ^ meta.function-call.terraform punctuation.section.brackets.end.terraform
#                                ^ meta.function-call.terraform punctuation.section.parens.end.terraform

/////////////////////////////////////////////////////////////////////
// TUPLE FOR-EXPRESSIONS
/////////////////////////////////////////////////////////////////////

/////
// Basic expression.
/////

// TODO

/////
// Object or map source value.
////

// TODO

/////
// Complex right-side expressions.
////

// TODO

/////
// Legacy splat expression attribute access.
/////

// TODO

/////
// Multi-line for-expressions.
/////

    value = [
#   ^^^^^ variable.declaration.terraform variable.other.readwrite.terraform
#         ^^ variable.declaration.terraform keyword.operator.assignment.terraform
#           ^ punctuation.section.brackets.begin.terraform
      for instance in aws_instance.ubuntu:
#     ^^^ keyword.control.terraform
#         ^^^^^^^^ variable.other.readwrite.terraform
#                  ^^ keyword.operator.word.terraform
#                     ^^^^^^^^^^^^ variable.other.readwrite.terraform
#                                 ^ punctuation.accessor.dot.terraform
#                                  ^^^^^^ variable.other.member.terraform
#                                        ^ keyword.operator.terraform
      instance.private_dns
#     ^^^^^^^^ variable.other.readwrite.terraform
#             ^ punctuation.accessor.dot.terraform
#              ^^^^^^^^^^^ variable.other.member.terraform
    ]
#   ^ punctuation.section.brackets.end.terraform

/////
// Match conditional on right-side expression.
/////

    value = [
#   ^^^^^ variable.declaration.terraform variable.other.readwrite.terraform
#         ^^ variable.declaration.terraform keyword.operator.assignment.terraform
#           ^ punctuation.section.brackets.begin.terraform
      for instance in aws_instance.ubuntu:
#     ^^^ keyword.control.terraform
#         ^^^^^^^^ variable.other.readwrite.terraform
#                  ^^ keyword.operator.word.terraform
#                     ^^^^^^^^^^^^ variable.other.readwrite.terraform
#                                 ^ punctuation.accessor.dot.terraform
#                                  ^^^^^^ variable.other.member.terraform
#                                        ^ keyword.operator.terraform 
      (instance.public_ip != "" ? list(instance.private_ip, instance.public_ip) : list(instance.private_ip))
#     ^ punctuation.section.parens.begin.terraform
#      ^^^^^^^^ variable.other.readwrite.terraform
#              ^ punctuation.accessor.dot.terraform
#               ^^^^^^^^^ variable.other.member.terraform
#                         ^^ keyword.operator.terraform
#                            ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                             ^ string.quoted.double.terraform punctuation.definition.string.end.terraform
#                               ^ keyword.operator.terraform
#                                 ^^^^ meta.function-call.terraform support.function.builtin.terraform
#                                     ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#                                      ^^^^^^^^ meta.function-call.terraform variable.parameter.terraform
#                                              ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                                               ^^^^^^^^^^ meta.function-call.terraform variable.other.member.terraform
#                                                         ^ meta.function-call.terraform punctuation.separator.terraform
#                                                           ^^^^^^^^ meta.function-call.terraform variable.parameter.terraform
#                                                                   ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                                                                    ^^^^^^^^^ meta.function-call.terraform variable.other.member.terraform
#                                                                             ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                                                                               ^ keyword.operator.terraform
#                                                                                 ^^^^ meta.function-call.terraform support.function.builtin.terraform
#                                                                                     ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#                                                                                      ^^^^^^^^ meta.function-call.terraform variable.parameter.terraform
#                                                                                              ^ meta.function-call.terraform punctuation.accessor.dot.terraform
#                                                                                               ^^^^^^^^^^ meta.function-call.terraform variable.other.member.terraform
#                                                                                                         ^ meta.function-call.terraform punctuation.section.parens.end.terraform 
#                                                                                                          ^ punctuation.section.parens.end.terraform
    ]
#   ^ punctuation.section.brackets.end.terraform

/////
// Match brackets on right-side expression.
/////

    value = [
#   ^^^^^ variable.declaration.terraform variable.other.readwrite.terraform
#         ^^ variable.declaration.terraform keyword.operator.assignment.terraform
#           ^ punctuation.section.brackets.begin.terraform 
      for instance in aws_instance.ubuntu:
#     ^^^ keyword.control.terraform
#         ^^^^^^^^ variable.other.readwrite.terraform
#                  ^^ keyword.operator.word.terraform
#                     ^^^^^^^^^^^^ variable.other.readwrite.terraform
#                                 ^ punctuation.accessor.dot.terraform
#                                  ^^^^^^ variable.other.member.terraform
#                                        ^ keyword.operator.terraform 
      (instance.public_ip != "" ? [instance.private_ip, instance.public_ip] : [instance.private_ip])
#     ^ punctuation.section.parens.begin.terraform
#      ^^^^^^^^ variable.other.readwrite.terraform
#              ^ punctuation.accessor.dot.terraform
#               ^^^^^^^^^ variable.other.member.terraform
#                         ^^ keyword.operator.terraform
#                            ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                             ^ string.quoted.double.terraform punctuation.definition.string.end.terraform
#                               ^ keyword.operator.terraform
#                                 ^ punctuation.section.brackets.begin.terraform
#                                          ^ punctuation.accessor.dot.terraform
#                                           ^^^^^^^^^^ variable.other.member.terraform
#                                                     ^ punctuation.separator.terraform
#                                                               ^ punctuation.accessor.dot.terraform 
#                                                                ^^^^^^^^^ variable.other.member.terraform  
#                                                                         ^ punctuation.section.brackets.end.terraform
#                                                                           ^ keyword.operator.terraform
#                                                                             ^ punctuation.section.brackets.begin.terraform
#                                                                                      ^ punctuation.accessor.dot.terraform
#                                                                                       ^^^^^^^^^^ variable.other.member.terraform
#                                                                                                 ^ punctuation.section.brackets.end.terraform  
#                                                                                                  ^ punctuation.section.parens.end.terraform 
    ]
#   ^ punctuation.section.brackets.end.terraform

/////
// Match if-conditionals on right-side.
/////

// TODO

/////
// Matches bracket-literals as range expression.
/////

    [for i, v in ["a", "b", "c"]: v if i < 2]
#   ^ punctuation.section.brackets.begin.terraform
#    ^^^ keyword.control.terraform
#        ^ variable.other.readwrite.terraform
#         ^ punctuation.separator.terraform
#           ^ variable.other.readwrite.terraform
#             ^^ keyword.operator.word.terraform
#                ^ punctuation.section.brackets.begin.terraform
#                 ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                  ^^ string.quoted.double.terraform
#                    ^ punctuation.separator.terraform
#                      ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                       ^^ string.quoted.double.terraform
#                         ^ punctuation.separator.terraform
#                           ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                            ^^ string.quoted.double.terraform
#                              ^ punctuation.section.brackets.end.terraform
#                               ^ keyword.operator.terraform
#                                 ^ variable.other.readwrite.terraform
#                                   ^^ keyword.control.conditional.terraform
#                                      ^ variable.other.readwrite.terraform
#                                        ^ keyword.operator.terraform
#                                          ^ constant.numeric.integer.terraform
#                                           ^ punctuation.section.brackets.end.terraform

/////////////////////////////////////////////////////////////////////
// OBJECT FOR-EXPRESSIONS
/////////////////////////////////////////////////////////////////////

/////
// Matches basic syntax.
/////

    {for i, v in ["a", "b"]: v => i}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^^^ meta.braces.terraform keyword.control.terraform
#        ^ variable.other.readwrite.terraform
#         ^ punctuation.separator.terraform
#           ^ variable.other.readwrite.terraform
#             ^^ keyword.operator.word.terraform
#                ^ punctuation.section.brackets.begin.terraform
#                 ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                  ^^ string.quoted.double.terraform
#                    ^ punctuation.separator.terraform
#                      ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                       ^^ string.quoted.double.terraform
#                         ^ punctuation.section.brackets.end.terraform
#                          ^ keyword.operator.terraform
#                            ^ variable.other.readwrite.terraform
#                              ^^ storage.type.function.terraform
#                                 ^ variable.other.readwrite.terraform
#                                  ^ punctuation.section.braces.end.terraform
#                                   ^ -meta

/////
// Matches ellipsis.
/////

    {for i, v in ["a"]: v => i...}
#   ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#    ^^^ meta.braces.terraform keyword.control.terraform
#        ^ variable.other.readwrite.terraform
#         ^ punctuation.separator.terraform
#           ^ variable.other.readwrite.terraform
#             ^^ keyword.operator.word.terraform
#                ^ punctuation.section.brackets.begin.terraform
#                 ^ string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                  ^^ string.quoted.double.terraform
#                    ^ punctuation.section.brackets.end.terraform
#                     ^ keyword.operator.terraform
#                       ^ variable.other.readwrite.terraform
#                         ^^ storage.type.function.terraform
#                            ^ variable.other.readwrite.terraform
#                             ^^^ keyword.operator.terraform
#                                ^ punctuation.section.braces.end.terraform

/////
// Matches if-conditional.
/////

// TODO

/////
// Matches over multiple-lines.
/////

// TODO

/////////////////////////////////////////////////////////////////////
// BLOCKS
/////////////////////////////////////////////////////////////////////

/////
// Inline block with no labels.
////

    thing  {}
#   ^^^^^ meta.type.terraform entity.name.type.terraform
#          ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#           ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////
// Inline block with string labels.
/////

    thing "label1"   "label2" {}
#   ^^^^^ meta.type.terraform entity.name.type.terraform
#         ^ meta.type.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#          ^^^^^^ meta.type.terraform string.quoted.double.terraform
#                ^ meta.type.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#                    ^ meta.type.terraform string.quoted.double.terraform punctuation.definition.string.begin.terraform
#                     ^^^^^^ meta.type.terraform string.quoted.double.terraform
#                           ^ meta.type.terraform string.quoted.double.terraform punctuation.definition.string.end.terraform
#                             ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#                              ^ meta.braces.terraform punctuation.section.braces.end.terraform
#                               ^ -meta

/////
// Inline block with identifier labels.
/////

    thing thing1 thing2 thing3 {}
#   ^^^^^ meta.type.terraform entity.name.type.terraform
#         ^^^^^^ meta.type.terraform entity.name.label.terraform
#                ^^^^^^ meta.type.terraform entity.name.label.terraform
#                       ^^^^^^ meta.type.terraform entity.name.label.terraform
#                              ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#                               ^ meta.braces.terraform punctuation.section.braces.end.terraform

//////
// Nested multi-line blocks with expressions.
/////

// TODO

/////
// Matches blocks with functions, objects, tuples.
/////

// TODO

/////////////////////////////////////////////////////////////////////
// TERRAFORM NAMED VALUES
/////////////////////////////////////////////////////////////////////

    var.something
#   ^^^ support.constant.terraform
#      ^ punctuation.accessor.dot.terraform
#       ^^^^^^^^^ variable.other.member.terraform

    local.something
#   ^^^^^ support.constant.terraform
#        ^ punctuation.accessor.dot.terraform
#         ^^^^^^^^^ variable.other.member.terraform

    module.name.output_name
#   ^^^^^^ support.constant.terraform
#         ^ punctuation.accessor.dot.terraform
#          ^^^^ variable.other.member.terraform
#              ^ punctuation.accessor.dot.terraform
#               ^^^^^^^^^^^ variable.other.member.terraform

    data.data_type.name
#   ^^^^ support.constant.terraform
#       ^ punctuation.accessor.dot.terraform
#        ^^^^^^^^^ variable.other.member.terraform
#                 ^ punctuation.accessor.dot.terraform
#                  ^^^^ variable.other.member.terraform

    path.module
#   ^^^^ support.constant.terraform
#       ^ punctuation.accessor.dot.terraform
#        ^^^^^^ variable.other.member.terraform

    terraform.workspace
#   ^^^^^^^^^ support.constant.terraform
#            ^ punctuation.accessor.dot.terraform
#             ^^^^^^^^^ variable.other.member.terraform

/////////////////////////////////////////////////////////////////////
// TERRAFORM TOP-LEVEL BLOCK TYPES
/////////////////////////////////////////////////////////////////////

    resource {}
#   ^^^^^^^^ meta.type.terraform storage.type.terraform
#            ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#             ^ meta.braces.terraform punctuation.section.braces.end.terraform

    provider {}
#   ^^^^^^^^ meta.type.terraform storage.type.terraform
#            ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#             ^ meta.braces.terraform punctuation.section.braces.end.terraform

    variable {}
#   ^^^^^^^^ meta.type.terraform storage.type.terraform
#            ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#             ^ meta.braces.terraform punctuation.section.braces.end.terraform

    output {}
#   ^^^^^^ meta.type.terraform storage.type.terraform
#          ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#           ^ meta.braces.terraform punctuation.section.braces.end.terraform

    locals {}
#   ^^^^^^ meta.type.terraform storage.type.terraform
#          ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#           ^ meta.braces.terraform punctuation.section.braces.end.terraform

    module {}
#   ^^^^^^ meta.type.terraform storage.type.terraform
#          ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#           ^ meta.braces.terraform punctuation.section.braces.end.terraform

    data {}
#   ^^^^ meta.type.terraform storage.type.terraform
#        ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#         ^ meta.braces.terraform punctuation.section.braces.end.terraform

    terraform {}
#   ^^^^^^^^^ meta.type.terraform storage.type.terraform
#             ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#              ^ meta.braces.terraform punctuation.section.braces.end.terraform

/////////////////////////////////////////////////////////////////////
// HEREDOCS
/////////////////////////////////////////////////////////////////////

/////
// Basic example.
/////
    << EOF
#   ^^ keyword.operator.heredoc.terraform
#      ^^^ keyword.control.heredoc.terraform
    sdfdfsd
#   ^^^^^^^^ string.unquoted.heredoc.terraform
    EOF
#   ^^^^ keyword.control.heredoc.terraform

/////
// With leading-spaces-operator.
/////

    <<- END
#   ^^^ keyword.operator.heredoc.terraform
#       ^^^ keyword.control.heredoc.terraform
    heredoc
#   ^^^^^^^^ string.unquoted.heredoc.terraform
    EOF
#   ^^^^ string.unquoted.heredoc.terraform
    END
#   ^^^^ keyword.control.heredoc.terraform

/////
// Includes string interpolation.
/////

// TODO