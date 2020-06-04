resource "aws_opsworks_stack" "main" {
  name                          = var.name
  region                        = data.aws_region.current.name
  service_role_arn              = aws_iam_role.main.arn
  default_instance_profile_arn  = aws_iam_instance_profile.ec2.arn
  agent_version                 = "LATEST"
  configuration_manager_version = 12
  default_ssh_key_name          = var.ssh_key_name
  use_custom_cookbooks          = true
  use_opsworks_security_groups  = true
  vpc_id                        = var.vpc_id
  default_subnet_id             = var.private_subnets[0]
  default_os                    = "Ubuntu 18.04 LTS"

  custom_cookbooks_source {
    type     = lookup(var.custom_cookbooks_source, "type", "git")
    url      = lookup(var.custom_cookbooks_source, "url", "https://github.com/shanmugakarna/opsworks-elasticsearch.git")
    ssh_key  = lookup(var.custom_cookbooks_source, "ssh_key", null)
    revision = lookup(var.custom_cookbooks_source, "revision", null)
  }

  custom_json = var.custom_json

  depends_on = [ aws_iam_role_policy_attachment.main ]
}
