#----------------------------------------------------------------------
# Project API
#----------------------------------------------------------------------

resource "aws_instance" "api" {

  count = "${var.api_count}"

  connection {
    user = "ubuntu",
    key_file = "${var.key_path}"
  }
  provider "remote-exec" {
    inline = [
      # Run inline commands
    ]
  }
}

/*
 * This is the API public DNS address
 */
output "api-public" {
  value = "${aws_instance.api.public_dns}"
}

variable "name" {
  type = string
  description = "describe your variable"
}



