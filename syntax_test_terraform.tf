# SYNTAX TEST "Terraform.sublime-syntax"

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