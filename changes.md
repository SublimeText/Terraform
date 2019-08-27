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

- *FIXED*: removed invalid constants `yes`, `no`, `on`, `off`.
- *ADDED*: `null` value from v0.12
- *ADDED*: syntax tests


[terraform]: https://www.terraform.io/docs/configuration/index.html
[hcl]: https://github.com/hashicorp/hcl2/blob/master/hcl/hclsyntax/spec.md
[st3-scopes]: https://www.sublimetext.com/docs/3/scope_naming.html