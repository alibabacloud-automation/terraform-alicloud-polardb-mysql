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
  #alicloud_polardb_database
  db_name               = "tf-dbname"
  create_database       = true
  db_character_set_name = "utf8"
  db_description        = var.db_description
  #alicloud_polardb_account
  create_account         = true
  account_name           = "tf_test123"
  account_password       = var.account_password
  account_description    = var.account_description
  kms_encrypted_password = var.kms_encrypted_password
  kms_encryption_context = var.kms_encryption_context
  account_type           = "Normal"
  #alicloud_polardb_endpoint
  create_endpoint    = true
  endpoint_type      = var.endpoint_type
  read_write_mode    = var.read_write_mode
  nodes              = var.nodes
  auto_add_new_nodes = var.auto_add_new_nodes
  endpoint_config    = var.endpoint_config
  ssl_enabled        = var.ssl_enabled
  net_type           = var.net_type
  ssl_auto_rotate    = var.ssl_auto_rotate
  #alicloud_polardb_endpoint_address
  create_endpoint_address = true
  connection_prefix       = var.connection_prefix
  #alicloud_polardb_account_privilege
  create_account_privilege = true
  account_privilege        = "ReadOnly"
  #alicloud_polardb_backup_policy
  create_backup_policy                        = true
  preferred_backup_period                     = var.preferred_backup_period
  preferred_backup_time                       = var.preferred_backup_time
  data_level1_backup_retention_period         = var.data_level1_backup_retention_period
  data_level2_backup_retention_period         = var.data_level2_backup_retention_period
  backup_retention_policy_on_cluster_deletion = var.backup_retention_policy_on_cluster_deletion
  backup_frequency                            = var.backup_frequency
  data_level1_backup_frequency                = var.data_level1_backup_frequency
  data_level1_backup_time                     = var.data_level1_backup_time
  data_level1_backup_period                   = var.data_level1_backup_period
  data_level2_backup_period                   = var.data_level2_backup_period
}