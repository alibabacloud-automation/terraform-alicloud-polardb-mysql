
db_node_class               = "polar.mysql.x4.large"
polardb_cluster_description = "update_polardb_cluster_description"
modify_type                 = "Upgrade"
db_node_count               = 3
renewal_status              = "Normal"
auto_renew_period           = 2
period                      = 2
maintain_time               = "16:00Z-17:00Z"
collector_status            = "Enable"
tde_status                  = "Enabled"
encrypt_new_tables          = null
security_group_ids          = null
db_description              = "update Database description"
deletion_lock               = 0
parameters = [
  {
    name  = "wait_timeout"
    value = "86"
  }
]
db_node_id             = "1"
hot_replica_mode       = "ON"
default_time_zone      = "-4:00"
lower_case_table_names = 1
db_node_num            = 1
loose_polar_log_bin    = "ON"
#target_db_revision_version_code = "20240314"
#planned_end_time                = "2024-04-12T13:50:00Z"
#planned_start_time              = "2024-04-12T14:10:00Z"
from_time_service = "false"
upgrade_type      = "ALL"
#alicloud_polardb_account
account_password       = "tf_test123456"
account_description    = "update_tf_account_description"
kms_encrypted_password = ""
kms_encryption_context = {}
#alicloud_polardb_endpoint
read_write_mode = "ReadWrite"
#alicloud_polardb_endpoint_address
connection_prefix = "testpolardbconn"
#alicloud_polardb_account_privilege
account_privilege = "ReadOnly"
#alicloud_polardb_backup_policy
preferred_backup_period                     = ["Tuesday", "Saturday"]
preferred_backup_time                       = "02:00Z-03:00Z"
data_level1_backup_retention_period         = "3"
data_level2_backup_retention_period         = "60"
backup_retention_policy_on_cluster_deletion = "LATEST"
backup_frequency                            = "Normal"
data_level1_backup_frequency                = "Normal"
data_level1_backup_time                     = "02:00Z-03:00Z"
data_level1_backup_period                   = ["Tuesday", "Saturday"]
data_level2_backup_period                   = ["Tuesday", "Saturday"]
log_backup_retention_period                 = "8"
