variable "profile" {
  default  = "nclouds"
}

variable "region" {
  default = "us-west-2"
}

variable "name" {
  default = "elasticsearch"
}

variable "vpc_cidr" {
  default = "10.255.0.0/16"
}

variable "tags" {
  type    = map
  default = {}
}

variable "master_instance" {
  default = {
    type  = "m5.large"
    count = 3
  }
}

variable "data_instance" {
  default = {
    type  = "m5.large"
    count = 3
  }
}
