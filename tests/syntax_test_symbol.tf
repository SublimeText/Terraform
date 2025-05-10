# SYNTAX TEST "Terraform.sublime-syntax"

 terraform {
#@@@@@@@@@ local-definition
  backend "gcs" {
# @@@@@@@@@@@@@ local-definition
    prefix = "minecraft/state"
    bucket = "terraform-larkworthy"
  }
}

# You need to fill these locals out with the project, region and zone
# Then to boot it up, run:-
#   gcloud auth application-default login
#   terraform init
#   terraform apply
 locals {
#@@@@@@ local-definition
  # The Google Cloud Project ID that will host and pay for your Minecraft server
  project = "larkworthy-tester"
  region  = "europe-west1"
  zone    = "europe-west1-b"
  # Allow members of an external Google group to turn on the server
  # through the Cloud Console mobile app or https://console.cloud.google.com
  # Create a group at https://groups.google.com/forum/#!creategroup
  # and invite members by their email address.
  enable_switch_access_group = 1
  minecraft_switch_access_group = "minecraft-switchers-lark@googlegroups.com"
}


 provider "google" {
#@@@@@@@@@@@@@@@@@ local-definition
#          @@@@@@ global-definition
  project = local.project
  region  = local.region
}

# Create service account to run service with no permissions
 resource "google_service_account" "minecraft" {
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ local-definition
#                                   @@@@@@@@@ global-definition
  account_id   = "minecraft"
  display_name = <<EOT
hello
world
EOT
  test = "Hello, %{ if var.name != "" }${var.name}%{ else }unnamed%{ endif }!"
  x = <<EOT
%{ for ip in aws_instance.example[*].private_ip ~}
server ${ip}
%{ endfor }
EOT
}

    provider "name" {}
#   @@@@@@@@@@@@@@@ local-definition
#             @@@@ global-definition
