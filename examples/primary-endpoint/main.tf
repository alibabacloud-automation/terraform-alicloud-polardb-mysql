data "alicloud_polardb_node_classes" "default" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "terraform-example"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_polardb_node_classes.default.classes[0].zone_id
  vswitch_name = "terraform-example"
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "default" {
  source = "../.."
  #alicloud_polardb_cluster
  create_cluster              = true
  db_version                  = "8.0"
  pay_type                    = "PostPaid"
  vswitch_id                  = alicloud_vswitch.default.id
  db_node_class               = var.db_node_class
  polardb_cluster_description = var.polardb_cluster_description
  modify_type                 = var.modify_type
  db_node_count               = var.db_node_count
  renewal_status              = var.renewal_status
  auto_renew_period           = var.auto_renew_period
  period                      = var.period
  security_ips                = var.security_ips
  maintain_time               = var.maintain_time
  collector_status            = var.collector_status
  parameters = [
    {
      name  = "wait_timeout"
      value = "86"
    }
  ]
  tde_status         = var.tde_status
  encrypt_new_tables = var.encrypt_new_tables
  security_group_ids = var.security_group_ids
  tags = {
    Created = "TF"
  }
  #alicloud_polardb_primary_endpoint
  create_primary_endpoint            = true
  primary_endpoint_ssl_enabled       = var.primary_endpoint_ssl_enabled
  primary_endpoint_net_type          = var.primary_endpoint_net_type
  primary_endpoint_ssl_auto_rotate   = var.primary_endpoint_ssl_auto_rotate
  primary_endpoint_description       = var.primary_endpoint_description
  primary_endpoint_connection_prefix = "${var.primary_endpoint_connection_prefix}-${random_integer.default.result}"
  primary_endpoint_port              = var.primary_endpoint_port
}