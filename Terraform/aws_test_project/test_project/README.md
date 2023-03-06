<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.57.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.postgres](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.postgres](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/db_subnet_group) | resource |
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/eip) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/instance) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/internet_gateway) | resource |
| [aws_key_pair.deployer](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/key_pair) | resource |
| [aws_lb.front_end](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/lb) | resource |
| [aws_lb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.ec2_tg_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/lb_target_group_attachment) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private-routes](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-routes](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/route_table_association) | resource |
| [aws_security_group.allow-db-access](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/security_group) | resource |
| [aws_security_group.allow-ex-ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/security_group) | resource |
| [aws_security_group.allow-http](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/security_group) | resource |
| [aws_security_group.allow-internal-ssh-http](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/security_group) | resource |
| [aws_subnet.private-subnets](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/subnet) | resource |
| [aws_subnet.public-subnets](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/vpc) | resource |
| [aws_vpc_security_group_ingress_rule.allow-db-access](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.allow-ex-ssh](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.allow-http](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.57.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_lb"></a> [create\_lb](#input\_create\_lb) | Controls if the Load Balancer should be created | `bool` | `true` | no |
| <a name="input_putin_khuylo"></a> [putin\_khuylo](#input\_putin\_khuylo) | Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo! | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh_private_key"></a> [ssh\_private\_key](#output\_ssh\_private\_key) | n/a |
| <a name="output_ssh_public_key"></a> [ssh\_public\_key](#output\_ssh\_public\_key) | n/a |
<!-- END_TF_DOCS -->