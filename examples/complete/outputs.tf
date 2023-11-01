
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = module.default.cluster_id
}

output "cluster_connection_string" {
  description = "The PolarDB cluster connection string."
  value       = module.default.cluster_connection_string
}

output "database_id" {
  description = "The current database resource ID."
  value       = module.default.database_id
}

output "account_id" {
  description = "The current account resource ID."
  value       = module.default.account_id
}

output "endpoint_id" {
  description = "The id of the polardb endpoint."
  value       = module.default.endpoint_id
}

output "endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires."
  value       = module.default.endpoint_ssl_expire_time
}

output "endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = module.default.endpoint_ssl_connection_string
}

output "endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = module.default.endpoint_address_id
}

output "endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = module.default.endpoint_address_port
}

output "endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = module.default.endpoint_address_connection_string
}

output "endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = module.default.endpoint_address_ip_address
}

output "account_privilege_id" {
  description = "The id of the polardb account privilege."
  value       = module.default.account_privilege_id
}

output "backup_policy_retention_period" {
  description = "Cluster backup retention days, Fixed for 7 days, not modified."
  value       = module.default.backup_policy_retention_period
}

output "backup_policy_data_level1_backup_retention_period" {
  description = "The retention period of level-1 backups. Valid values: 3 to 14. Unit: days."
  value       = module.default.backup_policy_data_level1_backup_retention_period
}

output "backup_policy_data_level2_backup_retention_period" {
  description = "The retention period of level-2 backups. Valid values are 0, 30 to 7300, -1. Default to 0."
  value       = module.default.backup_policy_data_level2_backup_retention_period
}

output "backup_policy_backup_retention_policy_on_cluster_deletion" {
  description = "Specifies whether to retain backups when you delete a cluster. Valid values are ALL, LATEST, NONE. Default to NONE."
  value       = module.default.backup_policy_backup_retention_policy_on_cluster_deletion
}

output "backup_policy_backup_frequency" {
  description = "The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  value       = module.default.backup_policy_backup_frequency
}

output "backup_policy_data_level1_backup_frequency" {
  description = "The Id of cluster that can run database.The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  value       = module.default.backup_policy_data_level1_backup_frequency
}

output "backup_policy_data_level1_backup_time" {
  description = "The time period during which automatic backup is performed. The format is HH: MMZ HH: MMZ (UTC time), and the entered value must be an hour apart, such as 14:00z-15:00z."
  value       = module.default.backup_policy_data_level1_backup_time
}

output "backup_policy_data_level1_backup_period" {
  description = "PolarDB Cluster of level-1 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  value       = module.default.backup_policy_data_level1_backup_period
}

output "backup_policy_data_level2_backup_period" {
  description = "PolarDB Cluster of level-2 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  value       = module.default.backup_policy_data_level2_backup_period
}