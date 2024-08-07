# SYNTAX TEST "Terraform-vars.sublime-syntax"

/////////////////////////////////////////////////////////////////////
// INLINE COMMENTS
/////////////////////////////////////////////////////////////////////

/////
// Start of line inline comments with `#`.
/////

# inline comment
# ^ source.terraform-vars comment.line.terraform

/////
// Start of line inline comments with `//`.
/////

// foo
# ^ source.terraform-vars comment.line.terraform

/////////////////////////////////////////////////////////////////////
// LANGUAGE CONSTANTS
/////////////////////////////////////////////////////////////////////

    true
# ^ -constant
#   ^^^^ constant.language.terraform
#         ^ -constant

    444
# ^ -constant -numeric
#   ^^^ constant.numeric.integer.terraform


    aws_route53_zone.main.zone_id
#   ^^^^^^^^^^^^^^^^ -numeric -constant
#                   ^ punctuation.accessor.dot.terraform
#                    ^^^^ variable.other.member.terraform
#                        ^ punctuation.accessor.dot.terraform
#                         ^^^^^^^ variable.other.member.terraform


      1.2
# ^ -constant -numeric
#     ^ constant.numeric.float.terraform
#      ^ punctuation.separator.decimal.terraform
#       ^ constant.numeric.float.terraform

      "a string"
#   ^ -punctuation -string
#     ^ punctuation.definition.string.begin.terraform
#     ^^^^^^^^^^ string.quoted.double.terraform
#              ^ punctuation.definition.string.end.terraform
#                 ^ -punctuation -string

      "some ${interpolation} string"
#   ^ -punctuation -string
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.terraform
#     ^^^^^^ string.quoted.double.terraform
#     ^ punctuation.definition.string.begin.terraform
#           ^^^^^^^^^^^^^^^^ meta.interpolation.terraform
#           ^^ punctuation.section.interpolation.begin.terraform
#             ^^^^^^^^^^^^^ source.terraform
#                          ^ punctuation.section.interpolation.end.terraform
#                           ^^^^^^^^ string.quoted.double.terraform
#                                  ^ punctuation.definition.string.end.terraform
#                                   ^ -punctuation -string

    a + b
#    ^ -keyword -operator
#     ^ keyword.operator.arithmetic.terraform
#      ^ -keyword -operator

    length(some_list) > 0 ? some_list[0] : default
#   ^^^^^^ meta.function-call.terraform support.function.builtin.terraform
#         ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#          ^^^^^^^^^ meta.function-call.terraform
#                   ^ meta.function-call.terraform punctuation.section.parens.end.terraform
#                     ^ keyword.operator.terraform
#                       ^ constant.numeric.integer.terraform
#                         ^ keyword.operator.terraform
#                                    ^ punctuation.section.brackets.begin.terraform
#                                     ^ constant.numeric.integer.terraform
#                                      ^ punctuation.section.brackets.end.terraform
#                                        ^ keyword.operator.terraform

    [{a = 1}, {g = 2}]
#   ^ punctuation.section.brackets.begin.terraform
#    ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#     ^ meta.braces.terraform meta.mapping.key.terraform string.unquoted.terraform
#       ^ meta.braces.terraform keyword.operator.assignment.terraform
#         ^ meta.braces.terraform constant.numeric.integer.terraform
#          ^ meta.braces.terraform punctuation.section.braces.end.terraform
#           ^ punctuation.separator.terraform
#             ^ meta.braces.terraform punctuation.section.braces.begin.terraform
#              ^ meta.braces.terraform meta.mapping.key.terraform string.unquoted.terraform
#                ^ meta.braces.terraform keyword.operator.assignment.terraform
#                  ^ meta.braces.terraform constant.numeric.integer.terraform
#                   ^ meta.braces.terraform punctuation.section.braces.end.terraform
#                    ^ punctuation.section.brackets.end.terraform

    thing(l)
#   ^^^^^ meta.function-call.terraform variable.function.terraform
#        ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#         ^ meta.function-call.terraform
#          ^ meta.function-call.terraform punctuation.section.parens.end.terraform

      keys({a=1, c=2})
#     ^^^^ meta.function-call.terraform support.function.builtin.terraform
#         ^ meta.function-call.terraform punctuation.section.parens.begin.terraform
#          ^ meta.function-call.terraform meta.braces.terraform punctuation.section.braces.begin.terraform
#           ^ meta.function-call.terraform meta.braces.terraform meta.mapping.key.terraform string.unquoted.terraform
#            ^ meta.function-call.terraform meta.braces.terraform keyword.operator.assignment.terraform
#             ^ meta.function-call.terraform meta.braces.terraform constant.numeric.integer.terraform
#              ^ meta.function-call.terraform meta.braces.terraform punctuation.separator.terraform
#                ^ meta.function-call.terraform meta.braces.terraform meta.mapping.key.terraform string.unquoted.terraform
#                 ^ meta.function-call.terraform meta.braces.terraform keyword.operator.assignment.terraform
#                  ^ meta.function-call.terraform meta.braces.terraform constant.numeric.integer.terraform
#                   ^ meta.function-call.terraform meta.braces.terraform punctuation.section.braces.end.terraform
#                    ^ meta.function-call.terraform punctuation.section.parens.end.terraform

    [for s in var.list : upper(s)]
#   ^ punctuation.section.brackets.begin.terraform
#    ^^^ keyword.control.loop.for.terraform
#        ^ variable.other.readwrite.terraform
#          ^^ keyword.control.loop.in.terraform
#             ^^^ variable.language.terraform
#                ^ punctuation.accessor.dot.terraform
#                 ^^^^ variable.other.member.terraform
#                      ^ punctuation.section.block.loop.for.terraform
#                        ^^^^^^^^ meta.function-call.terraform
#                        ^^^^^ support.function.builtin.terraform
#                             ^ punctuation.section.parens.begin.terraform
#                               ^ punctuation.section.parens.end.terraform
#                                ^ punctuation.section.brackets.end.terraform

    {for i, v in ["a"]: v => i...}
#   ^^^^ meta.braces.terraform
#   ^ punctuation.section.braces.begin.terraform
#    ^^^ keyword.control.loop.for.terraform
#        ^ variable.other.readwrite.terraform
#         ^ punctuation.separator.terraform
#           ^ variable.other.readwrite.terraform
#             ^^ keyword.control.loop.in.terraform
#                ^ punctuation.section.brackets.begin.terraform
#                 ^^^ meta.string.terraform string.quoted.double.terraform
#                 ^ punctuation.definition.string.begin.terraform
#                   ^ punctuation.definition.string.end.terraform
#                    ^ punctuation.section.brackets.end.terraform
#                     ^ punctuation.section.block.loop.for.terraform
#                       ^ variable.other.readwrite.terraform
#                         ^^ punctuation.separator.key-value.terraform
#                            ^ variable.other.readwrite.terraform
#                             ^^^ keyword.operator.terraform
#                                ^ punctuation.section.braces.end.terraform

    thing "label1"   "label2" {}
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.type.terraform
#   ^^^^^ entity.name.type.terraform
#         ^^^^^^^^ string.quoted.double.terraform
#         ^ punctuation.definition.string.begin.terraform
#                ^ punctuation.definition.string.end.terraform
#                    ^^^^^^^^ string.quoted.double.terraform
#                    ^ punctuation.definition.string.begin.terraform
#                           ^ punctuation.definition.string.end.terraform
#                             ^ meta.block.terraform punctuation.section.block.begin.terraform
#                              ^ meta.block.terraform punctuation.section.block.end.terraform

    << EOF
#   ^^ keyword.operator.heredoc.terraform
#      ^^^ keyword.control.heredoc.terraform
    sdfdfsd
#   ^^^^^^^^ string.unquoted.heredoc.terraform
    EOF
#   ^^^^ keyword.control.heredoc.terraform

    terraform import aws_instance.example i-abcd1234
#   ^^^^^^^^^ support.constant.terraform
#             ^^^^^^ keyword.control.import.terraform
#                    ^^^^^^^^^^^^ entity.name.label.terraform
#                                ^ punctuation.accessor.dot.terraform
#                                 ^^^^^^^ variable.other.member.terraform
#                                         ^^^^^^^^^^ entity.name.label.terraform
