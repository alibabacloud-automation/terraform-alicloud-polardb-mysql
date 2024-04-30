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
  deletion_lock               = var.deletion_lock
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
  target_db_revision_version_code = var.target_db_revision_version_code
  db_node_id                      = var.db_node_id
  hot_replica_mode                = var.hot_replica_mode
  default_time_zone               = var.default_time_zone
  lower_case_table_names          = var.lower_case_table_names
  db_node_num                     = var.db_node_num
  loose_polar_log_bin             = var.loose_polar_log_bin
  planned_end_time                = var.planned_end_time
  planned_start_time              = var.planned_start_time
  from_time_service               = var.from_time_service
  upgrade_type                    = var.upgrade_type
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
  create_endpoint            = true
  endpoint_type              = var.endpoint_type
  read_write_mode            = var.read_write_mode
  nodes                      = var.nodes
  auto_add_new_nodes         = var.auto_add_new_nodes
  endpoint_config            = var.endpoint_config
  ssl_enabled                = var.ssl_enabled
  net_type                   = var.net_type
  ssl_auto_rotate            = var.ssl_auto_rotate
  endpoint_connection_prefix = "${var.endpoint_connection_prefix}-${random_integer.default.result}"
  #alicloud_polardb_endpoint_address
  create_endpoint_address = true
  connection_prefix       = "${var.connection_prefix}-${random_integer.default.result}"
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
  log_backup_retention_period                 = var.log_backup_retention_period
}

module "example" {
  source = "terraform-alicloud-modules/polardb-mysql/alicloud"
  #alicloud_polardb_cluster
  create_cluster              = true
  db_version                  = "8.0"
  pay_type                    = "PostPaid"
  db_node_class               = "polar.mysql.x4.medium"
  polardb_cluster_description = "tf-test"
  modify_type                 = "Upgrade"
  renewal_status              = "Normal"
  tde_status                  = "Disabled"
  parameters = [
    {
      name  = "wait_timeout"
      value = "86"
    }
  ]
  target_db_revision_version_code = "20240314"
  db_node_id                      = "1"
  hot_replica_mode                = "ON"
  default_time_zone               = "-4:00"
  lower_case_table_names          = 1
  db_node_num                     = 1
  loose_polar_log_bin             = "ON"
  planned_end_time                = "2024-04-12T13:50:00Z"
  planned_start_time              = "2024-04-12T14:10:00Z"
  from_time_service               = "false"
  upgrade_type                    = "ALL"
  #alicloud_polardb_database
  create_database = true
  db_name         = "tf-dbname"
  #alicloud_polardb_account
  create_account   = true
  account_name     = "tf_test123"
  account_password = "tf_test123"
  account_type     = "Normal"
  #alicloud_polardb_endpoint
  create_endpoint    = true
  endpoint_type      = "Custom"
  read_write_mode    = "ReadOnly"
  auto_add_new_nodes = "Enable"
  net_type           = "Public"
  #alicloud_polardb_endpoint_address
  create_endpoint_address = true
  connection_prefix       = "testpolardbconn"
  account_privilege       = "ReadOnly"
  #alicloud_polardb_account_privilege
  create_account_privilege = true
  #alicloud_polardb_backup_policy
  create_backup_policy                        = true
  preferred_backup_period                     = ["Tuesday", "Saturday"]
  preferred_backup_time                       = "02:00Z-03:00Z"
  data_level1_backup_retention_period         = "7"
  data_level2_backup_retention_period         = "60"
  backup_retention_policy_on_cluster_deletion = "LATEST"
  backup_frequency                            = "Normal"
  data_level1_backup_frequency                = "Normal"
  data_level1_backup_time                     = "02:00Z-03:00Z"
  data_level1_backup_period                   = ["Tuesday", "Saturday"]
  data_level2_backup_period                   = ["Tuesday", "Saturday"]
  log_backup_retention_period                 = "7"
  #alicloud_polardb_cluster_endpoint
  create_cluster_endpoint             = true
  cluster_private_connection_prefix   = "polardbmysqlprivateprefix"
  cluster_endpoint_private_port       = "5432"
  db_endpoint_description             = "test_cluster_endpoint"
  cluster_endpoint_nodes              = []
  cluster_endpoint_read_write_mode    = "ReadWrite"
  cluster_endpoint_auto_add_new_nodes = "Enable"
  cluster_endpoint_config             = {}
  cluster_endpoint_ssl_enabled        = "Disable"
  cluster_endpoint_net_type           = "Private"
  cluster_endpoint_ssl_auto_rotate    = "Disable"
  #alicloud_polardb_cluster_endpoint_address
  create_cluster_endpoint_address  = true
  cluster_public_connection_prefix = "polardbmysqlpublicprefix"
  cluster_endpoint_public_port     = "3999"
}