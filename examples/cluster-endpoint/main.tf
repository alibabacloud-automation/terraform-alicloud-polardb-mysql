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

  #alicloud_polardb_cluster_endpoint
  create_cluster_endpoint             = true
  cluster_private_connection_prefix   = "polardbmysqlprivateprefix${random_integer.default.result}"
  cluster_endpoint_private_port       = "5432"
  db_endpoint_description             = var.db_endpoint_description
  cluster_endpoint_nodes              = var.cluster_endpoint_nodes
  cluster_endpoint_read_write_mode    = var.cluster_endpoint_read_write_mode
  cluster_endpoint_auto_add_new_nodes = var.cluster_endpoint_auto_add_new_nodes
  cluster_endpoint_config             = var.cluster_endpoint_config
  cluster_endpoint_ssl_enabled        = "Enable"
  cluster_endpoint_net_type           = var.cluster_endpoint_net_type
  cluster_endpoint_ssl_auto_rotate    = var.cluster_endpoint_ssl_auto_rotate

  #alicloud_polardb_cluster_endpoint_address
  create_cluster_endpoint_address  = true
  cluster_public_connection_prefix = "polardbmysqlpublicprefix${random_integer.default.result}"
  cluster_endpoint_public_port     = "3999"
}