# SYNTAX TEST reindent-unchanged "Terraform.sublime-syntax"

provider "name" {
  attr1 = {
    key1 = {
      key11 = {
        key111 = 0
        key112 = [
          "0",
          "1"
        ]
      },
      key12 = [
        0,
        1,
      ],
      key13 = (
        var.member
        + var.other
      )
    }
  }

  attr2 = jsondecode(
    {
      "key1": {
        "key11": [
          0,
          1
        ],
        "key12": {
          "key121": "value",
          "key122": 0
        }
      }
    }
  )
}