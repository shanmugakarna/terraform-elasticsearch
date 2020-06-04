variable "name" {
  type    = string
  default = "elasticsearch"
}

variable "ssh_key_name" {
  type = string
}

variable "custom_cookbooks_source" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

variable "custom_json" {}
