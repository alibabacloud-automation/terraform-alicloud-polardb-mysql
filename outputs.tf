
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = concat(alicloud_polardb_cluster.cluster.*.id, [""])[0]
}

output "cluster_connection_string" {
  description = "The PolarDB cluster connection string."
  value       = concat(alicloud_polardb_cluster.cluster.*.connection_string, [""])[0]
}

output "database_id" {
  description = "The current database resource ID."
  value       = concat(alicloud_polardb_database.database.*.id, [""])[0]
}

output "account_id" {
  description = "The current account resource ID."
  value       = concat(alicloud_polardb_account.account.*.id, [""])[0]
}

output "endpoint_id" {
  description = "The id of the polardb endpoint."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.id, [""])[0]
}

output "endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.ssl_expire_time, [""])[0]
}

output "endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = concat(alicloud_polardb_endpoint.endpoint.*.ssl_connection_string, [""])[0]
}

output "endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.id, [""])[0]
}

output "endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.port, [""])[0]
}

output "endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.connection_string, [""])[0]
}

output "endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = concat(alicloud_polardb_endpoint_address.endpoint_address.*.ip_address, [""])[0]
}

output "account_privilege_id" {
  description = "The id of the polardb account privilege."
  value       = concat(alicloud_polardb_account_privilege.account_privilege.*.id, [""])[0]
}

output "backup_policy_retention_period" {
  description = "Cluster backup retention days, Fixed for 7 days, not modified."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_retention_period, [""])[0]
}

output "backup_policy_data_level1_backup_retention_period" {
  description = "The retention period of level-1 backups. Valid values: 3 to 14. Unit: days."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_retention_period, [""])[0]
}

output "backup_policy_data_level2_backup_retention_period" {
  description = "The retention period of level-2 backups. Valid values are 0, 30 to 7300, -1. Default to 0."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level2_backup_retention_period, [""])[0]
}

output "backup_policy_backup_retention_policy_on_cluster_deletion" {
  description = "Specifies whether to retain backups when you delete a cluster. Valid values are ALL, LATEST, NONE. Default to NONE."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.backup_retention_policy_on_cluster_deletion, [""])[0]
}

output "backup_policy_backup_frequency" {
  description = "The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.backup_frequency, [""])[0]
}

output "backup_policy_data_level1_backup_frequency" {
  description = "The Id of cluster that can run database.The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_frequency, [""])[0]
}

output "backup_policy_data_level1_backup_time" {
  description = "The time period during which automatic backup is performed. The format is HH: MMZ HH: MMZ (UTC time), and the entered value must be an hour apart, such as 14:00z-15:00z."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_time, [""])[0]
}

output "backup_policy_data_level1_backup_period" {
  description = "PolarDB Cluster of level-1 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level1_backup_period, [""])[0]
}

output "backup_policy_data_level2_backup_period" {
  description = "PolarDB Cluster of level-2 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.data_level2_backup_period, [""])[0]
}

output "backup_policy_log_backup_retention_period" {
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  value       = concat(alicloud_polardb_backup_policy.backup_policy.*.log_backup_retention_period, [""])[0]
}

output "cluster_endpoint_id" {
  description = "The current instance connection resource ID. Composed of instance ID and connection string with format."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.id, [""])[0]
}

output "cluster_endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.ssl_connection_string, [""])[0]
}
output "cluster_endpoint_type" {
  description = "Type of endpoint."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.endpoint_type, [""])[0]
}
output "cluster_endpoint_db_endpoint_id" {
  description = "The ID of the cluster endpoint."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.db_endpoint_id, [""])[0]
}
output "cluster_endpoint_ssl_certificate_url" {
  description = "The specifies SSL certificate download link."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.ssl_certificate_url, [""])[0]
}
output "cluster_endpoint_ssl_expire_time" {
  description = "The time when the SSL certificate expires. The time follows the ISO 8601 standard in the yyyy-MM-ddTHH:mm:ssZ format. The time is displayed in UTC."
  value       = concat(alicloud_polardb_cluster_endpoint.endpoint.*.ssl_expire_time, [""])[0]
}
output "cluster_endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = concat(alicloud_polardb_endpoint_address.cluster_endpoint_address.*.id, [""])[0]
}

output "cluster_endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = concat(alicloud_polardb_endpoint_address.cluster_endpoint_address.*.port, [""])[0]
}

output "cluster_endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = concat(alicloud_polardb_endpoint_address.cluster_endpoint_address.*.connection_string, [""])[0]
}

output "cluster_endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = concat(alicloud_polardb_endpoint_address.cluster_endpoint_address.*.ip_address, [""])[0]
}