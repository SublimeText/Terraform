# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- [Syntax tests][tests] have been added.
- `null` constant.
- [Exponents][exponents] in numeric literals.
- [Character escapes][strings] for newline, carriage return, backslash, quote, and unicode points inside string literals.
- [Trim-left and trim-right operators][string-templates] inside string templates.
- [Directives][string-templates] inside string templates.
- Match all valid expressions inside string templates.
- Comparison operators `==`, `!=`, `<`, `>`, `<=`, `>=`.
- Arithmetic operators `+`, `-`, `*`, `/`, `%`.
- Logic operators `&&`, `||`, `!`.
- Conditional operator `p ? e1 : e2`
- Parenthesis matching.
- Tuple list syntax.
- Square-bracket [index notation][indices].
- [Full-splat][splat] operator.
- Comma matching inside function calls, tuples, maps, and for-expressions.
- Attribute-access is matched on named members and the `.` dot operator.
- [Attribute-only splat][splat] operator.
- Allow `-` after first alpha character in identifiers.
- Computed attribute named using parenthesis.
- Allow function-calls outside of string interpolation.
- Match all valid expressions inside function-call parameter lists.
- Match functions unknown to Terraform (for other HCL uses).
- Nested function calls.
- Match [for-expressions][for-exp] inside tuples and maps.
- Map collection syntax.
- Match unknown block names.
- Support for variable number of block labels.
- Support for unquote, identifier block labels.
- Nested blocks.
- Inline blocks.
- Terraform [named values][named-values].
- Built-in block types `locals` and `terraform`.
- Meta-scope `meta.block.terraform` added to all block bodies.
- [Primitive type constants][types].
- Heredocs with the leading-spaces operator `<<-`.
- String interpolation inside heredocs.

### Changed

- Rename scope `comment.line.number-sign.terraform` to `comment.line.terraform` to better reflect [scope naming standards][scopes].
- Rename scope `constant.numeric.terraform` to `constant.numeric.[integer|float].terraform` to better reflect [scope naming standards][scopes].
- Rename scope `entity.tag.embedded.[begin|end]` to `punctuation.section.interpolation.[begin|end]` to better reflect [scope naming standards][scopes].
- Rename scope `variable.other.assignment.terraform` to `variable.other.readwrite.terraform` to better reflect [scope naming standards][scopes].
    - A `meta_scope` of `variable.declaration.terraform` covers the entire attribute definition now.
- Rename scope for `=` in assignments from `keyword.operator` to `keyword.operator.assignment` to better reflect [scope naming standards][scopes].
- Rename scope `keyword.other.function.inline` to `support.function.builtin` to better reflect [scope naming standards][scopes].
- Rename scope for known block types from `storage.type.function.terraform` to `storage.type.terraform` to better reflect [scope naming standards][scopes].
- Rename scope for block labels from `string.value.terraform` to `string.quoted.double.terraform` to better reflect [scope naming standards][scopes].
- Rename meta-scope for block definitions from `meta.block.terraform` to `meta.type.terraform` to better reflect [scope naming standards][scopes].

### Removed

- Invalid constants `yes`, `no`, `on`, and `off`.
- [Unit of measurement suffixes][uom-suffixes].
- [Hexadecimal literals][hex-literals].
- An extra `string.terraform` scope was previously added to all string literals.
- [`atlas` blocks][atlas].

### Fixed

- Remove the `string.*` scope inside string templates.

[atlas]: https://www.terraform.io/docs/configuration/terraform-enterprise.html
[exponents]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md#numeric-literals
[hex-literals]: https://github.com/hashicorp/terraform/issues/20933#issuecomment-480050478
[for-exp]: https://www.terraform.io/docs/configuration/expressions.html#for-expressions
[indices]: https://www.terraform.io/docs/configuration/expressions.html#indices-and-attributes
[named-values]: https://www.terraform.io/docs/configuration/expressions.html#references-to-named-values
[old-splat]: https://www.terraform.io/docs/configuration/expressions.html#legacy-attribute-only-splat-expressions
[scopes]: https://www.sublimetext.com/docs/3/scope_naming.html
[splat]: https://www.terraform.io/docs/configuration/expressions.html#splat-expressions
[string-templates]: https://www.terraform.io/docs/configuration/expressions.html#string-literals
[strings]: https://www.terraform.io/docs/configuration/expressions.html#string-literals
[tests]: https://www.sublimetext.com/docs/3/syntax.html#testing
[types]: https://www.terraform.io/docs/configuration/types.html
[uom-suffixes]: https://github.com/hashicorp/terraform/issues/3287#issuecomment-241560576