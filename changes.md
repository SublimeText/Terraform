# Changes

The following changes have been made in order to either more closely follow the ST3 [scope naming conventions][st3-scopes] or to better align with the [HCL][hcl] or [Terraform][terraform] language specs.

### Inline Comments

- *CHANGED:* scope `comment.line.number-sign.terraform` to `comment.line.terraform`
    - Better reflects scoping conventions
- *FIXED:* used `number-sign` even for `//` inline comments
- *ADDED:* syntax tests

### Block Comments

- *ADDED:* syntax tests

### Language Constants

- *REMOVED*: invalid constants `yes`, `no`, `on`, `off`.
- *ADDED*: `null` value
- *ADDED*: syntax tests

### Numbers

- Separated into `Integers` and `Floats`
- *REMOVED*: [unit of measurement suffixes][uom-suffixes].
- *REMOVED*: [hexadecimal literals][hex-literals].

### Integers

- *CHANGED*: scope `constant.numeric.terraform` is now `constant.numeric.integer.terraform`
    - Better reflects scoping conventions
- *ADDED*: syntax tests

### Floats

- *CHANGED*: scope `constant.numeric.terraform` is now `constant.numeric.float.terraform`
    - Better reflects scoping conventions
- *ADDED*: exponents in float literals
- *ADDED*: syntax tests

### Identifiers

- *ADDED*: allow `-` after first alpha character

### Strings, Interpolation

- *REMOVED*: the extra `string.terraform` scope
- *ADDED*: character escapes for newline, carriage return, backslash, quote, and unicode points
- *CHANGED*: scope `entity.tag.embedded.[begin|end]` is now `punctuation.section.interpolation.[begin|end]`
    - Better reflects scoping conventions
- *FIXED*: use `clear_scopes` to remove the `string.*` scope inside interpolation
- *ADDED*: the trim-left and trim-right operators inside interpolation
- *ADDED*: template if/for directives
- *ADDED*: match literals inside string interpolation
- *ADDED*: syntax tests

### Operators

- *ADDED*: comparison operators `==`, `!=`, `<`, `>`, `<=`, `>=`
- *ADDED*: arithmetic operators `+`, `-`, `*`, `/`, `%`
- *ADDED*: logic operators `&&`, `||`, `!`
- *ADDED*: conditional operator `predicate ? expression : expression`
- *ADDED*: syntax tests

### Arrays

- *ADDED*: first-class array syntax
- *ADDED*: matches index operations
- *ADDED*: [full splat][splat] operator
- *ADDED*: `punctuation.separator` on commas
- *ADDED*: syntax tests

### Attribute-Access

- *ADDED*: `variable.other.member` scope on attribute access
- *ADDED*: `punctuation.accessor.dot` scope on dot-operator
- *ADDED*: [attribute-only splat][splat] operator
- *ADDED*: matches attribute-access inside string interpolation
- *ADDED*: syntax-tests

[hcl]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md
[hex-literals]: https://github.com/hashicorp/terraform/issues/20933#issuecomment-480050478
[splat]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md#splat-operators
[st3-scopes]: https://www.sublimetext.com/docs/3/scope_naming.html
[terraform]: https://www.terraform.io/docs/configuration/index.html
[uom-suffixes]: https://github.com/hashicorp/terraform/issues/3287#issuecomment-241560576