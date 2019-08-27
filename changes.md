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

[hcl]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md
[hex-literals]: https://github.com/hashicorp/terraform/issues/20933#issuecomment-480050478
[st3-scopes]: https://www.sublimetext.com/docs/3/scope_naming.html
[terraform]: https://www.terraform.io/docs/configuration/index.html
[uom-suffixes]: https://github.com/hashicorp/terraform/issues/3287#issuecomment-241560576