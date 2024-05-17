
resource "alicloud_polardb_cluster" "cluster" {
  count              = var.create_cluster ? 1 : 0
  db_type            = "MySQL"
  vswitch_id         = var.vswitch_id
  zone_id            = var.zone_id
  db_version         = var.db_version
  pay_type           = var.pay_type
  db_node_class      = var.db_node_class
  description        = var.polardb_cluster_description
  modify_type        = var.modify_type
  db_node_count      = var.db_node_count
  renewal_status     = var.renewal_status
  auto_renew_period  = var.auto_renew_period
  period             = var.period
  security_ips       = var.security_ips
  resource_group_id  = var.resource_group_id
  maintain_time      = var.maintain_time
  collector_status   = var.collector_status
  tde_status         = var.tde_status
  encrypt_new_tables = var.encrypt_new_tables
  security_group_ids = var.security_group_ids
  deletion_lock      = var.deletion_lock
  dynamic "parameters" {
    for_each = var.parameters
    content {
      name  = lookup(parameters.value, "name", null)
      value = lookup(parameters.value, "value", null)
    }
  }
  tags                                        = var.tags
  vpc_id                                      = var.vpc_id
  encryption_key                              = var.encryption_key
  role_arn                                    = var.role_arn
  imci_switch                                 = var.imci_switch
  sub_category                                = var.sub_category
  creation_category                           = var.creation_category
  storage_type                                = var.storage_type
  storage_pay_type                            = var.storage_pay_type
  storage_space                               = var.storage_space
  hot_standby_cluster                         = var.hot_standby_cluster
  creation_option                             = var.creation_option
  source_resource_id                          = var.source_resource_id
  gdn_id                                      = var.gdn_id
  clone_data_point                            = var.clone_data_point
  serverless_type                             = var.serverless_type
  serverless_steady_switch                    = var.serverless_steady_switch
  scale_min                                   = var.scale_min
  scale_max                                   = var.scale_max
  scale_ro_num_min                            = var.scale_ro_num_min
  scale_ro_num_max                            = var.scale_ro_num_max
  allow_shut_down                             = var.allow_shut_down
  seconds_until_auto_pause                    = var.seconds_until_auto_pause
  scale_ap_ro_num_min                         = var.scale_ap_ro_num_min
  scale_ap_ro_num_max                         = var.scale_ap_ro_num_max
  proxy_type                                  = var.proxy_type
  proxy_class                                 = var.proxy_class
  backup_retention_policy_on_cluster_deletion = var.cluster_backup_retention_policy_on_cluster_deletion
  target_db_revision_version_code             = var.target_db_revision_version_code
  db_node_id                                  = var.db_node_id
  hot_replica_mode                            = var.hot_replica_mode
  default_time_zone                           = var.default_time_zone
  lower_case_table_names                      = var.lower_case_table_names
  db_node_num                                 = var.db_node_num
  loose_polar_log_bin                         = var.loose_polar_log_bin
  planned_end_time                            = var.planned_end_time
  planned_start_time                          = var.planned_start_time
  from_time_service                           = var.from_time_service
  upgrade_type                                = var.upgrade_type
}

resource "alicloud_polardb_database" "database" {
  count              = var.create_database ? 1 : 0
  db_cluster_id      = local.this_db_cluster_id
  db_name            = var.db_name
  character_set_name = var.db_character_set_name
  db_description     = var.db_description
}

resource "alicloud_polardb_account" "account" {
  count                  = var.create_account ? 1 : 0
  db_cluster_id          = local.this_db_cluster_id
  account_name           = var.account_name
  account_password       = var.account_password
  account_description    = var.account_description
  kms_encrypted_password = var.kms_encrypted_password
  kms_encryption_context = var.kms_encryption_context
  account_type           = var.account_type
}

resource "alicloud_polardb_endpoint" "endpoint" {
  count                   = var.create_endpoint ? 1 : 0
  db_cluster_id           = local.this_db_cluster_id
  endpoint_type           = var.endpoint_type
  read_write_mode         = var.read_write_mode
  nodes                   = var.nodes
  auto_add_new_nodes      = var.auto_add_new_nodes
  endpoint_config         = var.endpoint_config
  ssl_enabled             = var.ssl_enabled
  net_type                = var.net_type
  ssl_auto_rotate         = var.ssl_auto_rotate
  connection_prefix       = var.endpoint_connection_prefix
  db_endpoint_description = var.db_endpoint_description
  port                    = var.endpoint_port
}

resource "alicloud_polardb_endpoint_address" "endpoint_address" {
  count             = var.create_endpoint_address ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  db_endpoint_id    = concat(alicloud_polardb_endpoint.endpoint.*.db_endpoint_id, [""])[0]
  connection_prefix = var.connection_prefix
  net_type          = "Public"
  port              = var.endpoint_address_port
}

resource "alicloud_polardb_cluster_endpoint" "endpoint" {
  count                   = var.create_cluster_endpoint ? 1 : 0
  db_cluster_id           = local.this_db_cluster_id
  connection_prefix       = var.cluster_endpoint_private_connection_prefix
  port                    = var.cluster_endpoint_private_port
  read_write_mode         = var.cluster_endpoint_read_write_mode
  nodes                   = var.cluster_endpoint_nodes
  auto_add_new_nodes      = var.cluster_endpoint_auto_add_new_nodes
  endpoint_config         = var.cluster_endpoint_config
  ssl_enabled             = var.cluster_endpoint_ssl_enabled
  net_type                = var.cluster_endpoint_net_type
  ssl_auto_rotate         = var.cluster_endpoint_ssl_auto_rotate
  db_endpoint_description = var.cluster_endpoint_description
}

resource "alicloud_polardb_endpoint_address" "cluster_endpoint_address" {
  count             = var.create_cluster_endpoint_address ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  db_endpoint_id    = concat(alicloud_polardb_cluster_endpoint.endpoint.*.db_endpoint_id, [""])[0]
  net_type          = "Public"
  connection_prefix = var.cluster_endpoint_public_connection_prefix
  port              = var.cluster_endpoint_public_port
}

resource "alicloud_polardb_account_privilege" "account_privilege" {
  count             = var.create_account_privilege ? 1 : 0
  db_cluster_id     = local.this_db_cluster_id
  account_name      = concat(alicloud_polardb_account.account.*.account_name, [""])[0]
  db_names          = [concat(alicloud_polardb_database.database.*.db_name, [""])[0]]
  account_privilege = var.account_privilege
}

resource "alicloud_polardb_backup_policy" "backup_policy" {
  count                                              = var.create_backup_policy ? 1 : 0
  db_cluster_id                                      = local.this_db_cluster_id
  preferred_backup_period                            = var.preferred_backup_period
  preferred_backup_time                              = var.preferred_backup_time
  data_level1_backup_retention_period                = var.data_level1_backup_retention_period
  data_level2_backup_retention_period                = var.data_level2_backup_retention_period
  backup_retention_policy_on_cluster_deletion        = var.backup_retention_policy_on_cluster_deletion
  backup_frequency                                   = var.backup_frequency
  data_level1_backup_frequency                       = var.data_level1_backup_frequency
  data_level1_backup_time                            = var.data_level1_backup_time
  data_level1_backup_period                          = var.data_level1_backup_period
  data_level2_backup_period                          = var.data_level2_backup_period
  log_backup_retention_period                        = var.log_backup_retention_period
  data_level2_backup_another_region_region           = var.data_level2_backup_another_region_region
  data_level2_backup_another_region_retention_period = var.data_level2_backup_another_region_retention_period
  log_backup_another_region_region                   = var.log_backup_another_region_region
  log_backup_another_region_retention_period         = var.log_backup_another_region_retention_period
}

resource "alicloud_polardb_global_database_network" "global_database_network" {
  count         = var.create_global_database_network ? 1 : 0
  db_cluster_id = local.this_db_cluster_id
  description   = var.global_database_network_description
}

resource "alicloud_polardb_parameter_group" "parameter_group" {
  count      = var.create_global_database_network ? 1 : 0
  name       = var.parameter_group_name
  db_type    = "MySQL"
  db_version = var.parameter_group_db_version

  dynamic "parameters" {
    for_each = var.parameter_group_parameters
    content {
      param_name  = lookup(parameters.value, "param_name", null)
      param_value = lookup(parameters.value, "param_value", null)
    }
  }
  description = var.parameter_group_description
}

resource "alicloud_polardb_primary_endpoint" "primary_endpoint" {
  count                   = var.create_primary_endpoint ? 1 : 0
  db_cluster_id           = local.this_db_cluster_id
  ssl_enabled             = var.primary_endpoint_ssl_enabled
  net_type                = var.primary_endpoint_net_type
  ssl_auto_rotate         = var.primary_endpoint_ssl_auto_rotate
  db_endpoint_description = var.primary_endpoint_description
  connection_prefix       = var.primary_endpoint_connection_prefix
  port                    = var.primary_endpoint_port
}

