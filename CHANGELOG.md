# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## v1.0.0 - 2020-01-20

A huge thanks to @patrickrgaffney for this amazing contribution. [#39](https://github.com/alexlouden/Terraform.tmLanguage/pull/39)

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
- Match [for-expressions][for-exp] inside tuples and maps.
- Map collection syntax.
- Match unknown block names.
- Support for variable number of block labels.
- Nested blocks.
- Inline blocks.
- Terraform [named values][named-values].
- Update list of built-in Terraform functions.
- Built-in block types `locals` and `terraform`.
- Meta-scope `meta.block.terraform` added to all block bodies.
- [Primitive type constants][types].
- Heredocs with the leading-spaces operator `<<-`.
- String interpolation inside heredocs.
- [Import][import] statements.
- JSON highlighting for `*.tfstate` files.

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

## v0.19.0 - 2019-08-20

### Added

- Symbol indexing for top-level blocks. (@patrickrgaffney - #38)

## v0.18.0 - 2019-07-01

### Added

- Update list of built-in functions. (@Tenzer - #37)

### Fixed

- Allow hyphens in names of attributes inside string interpolation. (@Tenzer - #37)

## v0.17.0 - 2019-01-25

### Added

- [Sublime syntax][subl-format] format. (@thiagoalmeidasa - #35)

### Fixed

- Better support for parenthesis inside string interpolation. (@NightsPaladin - #33)

## v0.16.0 - 2018-08-08

### Added

- Snippet for `data` blocks. (@mschurenko - #32)

## v0.15.0 - 2018-02-22

### Added

- Terraform constant `local`. (@digitalfiz - #30)

## v0.14.0 - 2017-08-31

### Added

- Update list of built-in functions. (@gburiola - #27)

### Removed

- Built-in function `from`.

## v0.13.1 - 2017-08-10

### Fixed

- Allow nested function calls.

## v0.13.0 - 2017-06-07

### Changed

- Set default tab size to 2. (@kushmansingh - #25)
- Set default indentation to spaces. (@kushmansingh - #25)

## v0.12.2 - 2017-05-08

### Fixed

- Allow whitespace before `<<` when closing heredocs. (@GreatFruitOmsk - #24)

## v0.12.1 - 2017-03-31

### Fixed

- Escape hyphens in block labels

## v0.12.0 - 2017-03-30

### Added

- Code folding markers.
- Built-in Terraform functions.

### Fixed

- Function calls and attribute access inside string templates.

## v0.11.0 - 2017-03-08

### Added

- Heredocs.

## v0.10.0 - 2017-02-14

### Added

- `.hcl` file extensions (@akarnani - #19)

## v0.9.0 - 2017-02-12

### Fixed

- Handle nested string interpolation.

## v0.8.0 - 2017-02-08

### Added

- String interpolation.
- Unquoted block labels.

### Fixed

- De-emphasize variable assignment.

## v0.7.0 - 2017-01-10

### Added

- C-style single line comments `//`. (@kerma - #16)

## v0.6.0 - 2016-09-08

### Added

- Support for `data` blocks. (@Jonnymcc - #14)

## v0.5.0 - 2016-07-05

### Added

- Snippet for `provisioner` blocks. (@ApsOps - #13)

## v0.4.0 - 2016-06-08

### Added

- Match opening/closing brackets. (@alexlouden - #12)

## v0.3.0 - 2016-06-08

### Added

- Snippets for `module` blocks. (@maplebed - #10)

## v0.2.0 - 2016-03-01

### Added

- Blocks comments `/* ... */`. (@bigkraig - #8)

## v0.1.0 - 2015-08-04

Initial release.

[atlas]: https://www.terraform.io/docs/configuration/terraform-enterprise.html
[exponents]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md#numeric-literals
[hex-literals]: https://github.com/hashicorp/terraform/issues/20933#issuecomment-480050478
[for-exp]: https://www.terraform.io/docs/configuration/expressions.html#for-expressions
[import]: https://www.terraform.io/docs/import/usage.html
[indices]: https://www.terraform.io/docs/configuration/expressions.html#indices-and-attributes
[named-values]: https://www.terraform.io/docs/configuration/expressions.html#references-to-named-values
[old-splat]: https://www.terraform.io/docs/configuration/expressions.html#legacy-attribute-only-splat-expressions
[scopes]: https://www.sublimetext.com/docs/3/scope_naming.html
[splat]: https://www.terraform.io/docs/configuration/expressions.html#splat-expressions
[string-templates]: https://www.terraform.io/docs/configuration/expressions.html#string-literals
[strings]: https://www.terraform.io/docs/configuration/expressions.html#string-literals
[subl-format]: https://www.sublimetext.com/docs/3/syntax.html
[tests]: https://www.sublimetext.com/docs/3/syntax.html#testing
[types]: https://www.terraform.io/docs/configuration/types.html
[uom-suffixes]: https://github.com/hashicorp/terraform/issues/3287#issuecomment-241560576
