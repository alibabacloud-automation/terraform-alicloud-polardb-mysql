#alicloud_polardb_cluster
variable "db_node_class" {
  description = "The db_node_class of cluster node."
  type        = string
  default     = "polar.mysql.x4.medium"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = "polardb_cluster_description"
}

variable "modify_type" {
  description = "Use as db_node_class change class, define upgrade or downgrade. Valid values are Upgrade, Downgrade, Default to Upgrade."
  type        = string
  default     = "Upgrade"
}

variable "db_node_count" {
  description = "Number of the PolarDB cluster nodes, default is 2(Each cluster must contain at least a primary node and a read-only node). Add/remove nodes by modifying this parameter, valid values: [2~16]."
  type        = number
  default     = 2
}

variable "renewal_status" {
  description = "Valid values are AutoRenewal, Normal, NotRenewal, Default to NotRenewal."
  type        = string
  default     = "NotRenewal"
}

variable "auto_renew_period" {
  description = "Auto-renewal period of an cluster, in the unit of the month. It is valid when pay_type is PrePaid. Valid value:1, 2, 3, 6, 12, 24, 36, Default to 1."
  type        = number
  default     = 1
}

variable "period" {
  description = "The duration that you will buy DB cluster (in month). It is valid when pay_type is PrePaid. Valid values: [1~9], 12, 24, 36."
  type        = number
  default     = 1
}

variable "security_ips" {
  description = "List of IP addresses allowed to access all databases of an cluster."
  type        = set(string)
  default     = null
}

variable "maintain_time" {
  description = "Maintainable time period format of the instance: HH:MMZ-HH:MMZ (UTC time)"
  type        = string
  default     = "16:00Z-17:00Z"
}

variable "collector_status" {
  description = "Specifies whether to enable or disable SQL data collector. Valid values are Enable, Disabled."
  type        = string
  default     = null
}

variable "parameters" {
  description = "Set of parameters needs to be set after DB cluster was launched. name: The name of a parameter. value: The value of a parameter."
  type        = list(map(string))
  default     = []
}

variable "tde_status" {
  description = "The turn on TDE encryption. Valid values are Enabled, Disabled. "
  type        = string
  default     = "Disabled"
}

variable "encrypt_new_tables" {
  description = "The turn on table auto encryption. Valid values are ON, OFF. Only MySQL 8.0 supports."
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "The ID of the security group."
  type        = set(string)
  default     = null
}

variable "deletion_lock" {
  description = "Valid values are 0, 1. 1 means to open the cluster protection lock, 0 means to close the cluster protection lock. Cannot modify after created when pay_type is Prepaid."
  type        = number
  default     = null
}


variable "vpc_id" {
  description = "The id of the VPC."
  type        = string
  default     = null
}

variable "encryption_key" {
  description = "The ID of the custom key. `encryption_key` cannot be modified after TDE is opened."
  type        = string
  default     = null
}

variable "role_arn" {
  description = "The Alibaba Cloud Resource Name (ARN) of the RAM role. A RAM role is a virtual identity that you can create within your Alibaba Cloud account."
  type        = string
  default     = null
}

variable "imci_switch" {
  description = "Specifies whether to enable the In-Memory Column Index (IMCI) feature. Valid values are `ON`, `OFF`."
  type        = string
  default     = null
}

variable "sub_category" {
  description = "The category of the cluster. Valid values are `Exclusive`, `General`. Only MySQL supports.If the specifications between exclusive and shared are mutually matched, sub_category is a required field."
  type        = string
  default     = null
}

variable "creation_category" {
  description = "The edition of the PolarDB service. Valid values are `Normal`,`Basic`,`ArchiveNormal`,`NormalMultimaster`,`SENormal`."
  type        = string
  default     = null
}

variable "hot_standby_cluster" {
  description = "Whether to enable the hot standby cluster. Valid values are `ON`, `OFF`. Only MySQL supports."
  type        = string
  default     = null
}

variable "creation_option" {
  description = "The method that is used to create a cluster. Valid values are `Normal`,`CloneFromPolarDB`,`CloneFromRDS`,`MigrationFromRDS`,`CreateGdnStandby`. The default value is Normal. If DBType is set to MySQL and DBVersion is set to 5.6 or 5.7, this parameter can be set to CloneFromRDS or MigrationFromRDS. If DBType is set to MySQL and DBVersion is set to 8.0, this parameter can be set to CreateGdnStandby."
  type        = string
  default     = null
}

variable "cluster_backup_retention_policy_on_cluster_deletion" {
  description = "The retention policy for the backup sets when you delete the cluster.  Valid values are `ALL`, `LATEST`, `NONE`."
  type        = string
  default     = null
}

variable "target_db_revision_version_code" {
  description = "The Version Code of the target version, whose parameter values can be obtained from the [DescribeDBClusterVersion] interface."
  type        = string
  default     = null
}

variable "db_node_id" {
  description = "The ID of the node or node subscript. Node subscript values: 1 to 15."
  type        = string
  default     = null
}

variable "hot_replica_mode" {
  description = "Indicates whether the hot standby feature is enabled. Valid values are `ON`, `OFF`. Only MySQL supports."
  type        = string
  default     = null
}

variable "default_time_zone" {
  description = "The time zone of the cluster. Default value: `SYSTEM`. You can set the parameter to a value that is on the hour from -12:00 to +13:00 based on UTC. Example: 00:00. Default value: SYSTEM. This value indicates that the time zone of the cluster is the same as the time zone of the region."
  type        = string
  default     = "SYSTEM"
}

variable "lower_case_table_names" {
  description = "Specifies whether the table names are case-sensitive. Default value: `1`.  Valid values are `1`, `0`."
  type        = number
  default     = 1
}

variable "db_node_num" {
  description = "The number of Standard Edition nodes. Default value: `1`. Valid values are `1`, `2`."
  type        = number
  default     = null
}

variable "loose_polar_log_bin" {
  description = "Enable the Binlog function. Default value: `OFF`. Valid values are `OFF`, `ON`."
  type        = string
  default     = "OFF"
}

variable "planned_end_time" {
  description = "The latest time to start executing the target scheduled task. The format is YYYY-MM-DDThh: mm: ssZ (UTC)."
  type        = string
  default     = null
}

variable "planned_start_time" {
  description = "The earliest time to start executing a scheduled (i.e. within the target time period) kernel version upgrade task. The format is YYYY-MM-DDThh: mm: ssZ (UTC)."
  type        = string
  default     = null
}

variable "from_time_service" {
  description = "Immediate or scheduled kernel version upgrade. Valid values are `true`, `false`. True means immediate execution, False means scheduled execution."
  type        = string
  default     = null
}

variable "upgrade_type" {
  description = "Version upgrade type. Default value: `ALL`. Valid values are PROXY, DB, ALL. PROXY means upgrading the proxy version, DB means upgrading the db version, ALL means upgrading both db and proxy versions simultaneously."
  type        = string
  default     = "ALL"
}

#alicloud_polardb_database
variable "db_description" {
  description = "Database description."
  type        = string
  default     = "Database description"
}
#alicloud_polardb_account
variable "account_password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  type        = string
  default     = "tf_test123"
}

variable "account_description" {
  description = "The specification of account description."
  type        = string
  default     = "tf_account_description"
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to a db account. If the account_password is filled in, this field will be ignored."
  type        = string
  default     = ""
}

variable "kms_encryption_context" {
  description = "An KMS encryption context,It is valid when kms_encrypted_password is set."
  type        = map(any)
  default     = {}
}

#alicloud_polardb_endpoint
variable "endpoint_type" {
  description = "Type of the endpoint. Custom, Cluster, Primary are valid, default to Custom. However when creating a new endpoint, it also only can be Custom."
  type        = string
  default     = "Custom"
}
variable "read_write_mode" {
  description = "Read or write mode. Valid values are ReadWrite, ReadOnly. When creating a new custom endpoint, default to ReadOnly."
  type        = string
  default     = "ReadOnly"
}
variable "nodes" {
  description = "Node id list for endpoint configuration. Default is all nodes."
  type        = set(string)
  default     = null
}
variable "auto_add_new_nodes" {
  description = "Whether the new node automatically joins the default cluster address. Valid values are Enable, Disable. When creating a new custom endpoint, default to Disable."
  type        = string
  default     = "Enable"
}
variable "endpoint_config" {
  description = "The advanced settings of the endpoint of Apsara PolarDB clusters are in JSON format."
  type        = map(any)
  default     = {}
}
variable "ssl_enabled" {
  description = "Specifies how to modify the SSL encryption status. Valid values: Disable, Enable, Update."
  type        = string
  default     = "Disable"
}
variable "net_type" {
  description = "The network type of the endpoint address.Valid values: Public, Private, Inner."
  type        = string
  default     = "Private"
}
variable "ssl_auto_rotate" {
  description = "Specifies whether automatic rotation of SSL certificates is enabled. Valid values: Enable,Disable."
  type        = string
  default     = "Disable"
}

variable "endpoint_connection_prefix" {
  description = "The Prefix of the specified endpoint."
  type        = string
  default     = "testprivateprefix"
}

variable "db_endpoint_description" {
  description = "The name of the custom cluster endpoint."
  type        = string
  default     = ""
}

variable "endpoint_port" {
  description = "Port of the specified private endpoint. Valid values: 3000 to 5999."
  type        = string
  default     = null
}

#alicloud_polardb_endpoint_address
variable "connection_prefix" {
  description = "The Prefix of the specified endpoint."
  type        = string
  default     = "testpolardbconn"
}

variable "endpoint_address_port" {
  description = "Port of the specified public endpoint. Valid values: 3000 to 5999."
  type        = string
  default     = null
}

#alicloud_polardb_account_privilege
variable "account_privilege" {
  description = "The privilege of one account access database. Valid values: ReadOnly, ReadWrite, DMLOnly, DDLOnly. Default to ReadOnly."
  type        = string
  default     = "ReadOnly"
}

#alicloud_polardb_backup_policy
variable "preferred_backup_period" {
  description = "PolarDB Cluster backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. Default to ['Tuesday','Thursday', 'Saturday']."
  type        = set(string)
  default     = ["Tuesday", "Thursday", "Saturday"]
}

variable "preferred_backup_time" {
  description = "PolarDB Cluster backup time, in the format of HH:mmZ- HH:mmZ. Time setting interval is one hour. Default to '02:00Z-03:00Z'. China time is 8 hours behind it."
  type        = string
  default     = "02:00Z-03:00Z"
}

variable "data_level1_backup_retention_period" {
  description = "The retention period of level-1 backups. Valid values: 3 to 14. Unit: days."
  type        = string
  default     = null
}

variable "data_level2_backup_retention_period" {
  description = "The retention period of level-2 backups. Valid values are 0, 30 to 7300, -1. Default to 0."
  type        = string
  default     = null
}

variable "backup_retention_policy_on_cluster_deletion" {
  description = "Specifies whether to retain backups when you delete a cluster. Valid values are ALL, LATEST, NONE. Default to NONE."
  type        = string
  default     = null
}

variable "backup_frequency" {
  description = "The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  type        = string
  default     = null
}

variable "data_level1_backup_frequency" {
  description = "The Id of cluster that can run database.The backup frequency. Valid values are Normal, 2/24H, 3/24H, 4/24H.Default to Normal."
  type        = string
  default     = null
}

variable "data_level1_backup_time" {
  description = "The time period during which automatic backup is performed. The format is HH: MMZ HH: MMZ (UTC time), and the entered value must be an hour apart, such as 14:00z-15:00z."
  type        = string
  default     = null
}

variable "data_level1_backup_period" {
  description = "PolarDB Cluster of level-1 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  type        = set(string)
  default     = null
}

variable "data_level2_backup_period" {
  description = "PolarDB Cluster of level-2 backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. NOTE: Note Select at least two values. Separate multiple values with commas (,)."
  type        = set(string)
  default     = null
}

variable "log_backup_retention_period" {
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  type        = string
  default     = "8"
}

variable "data_level2_backup_another_region_region" {
  description = "PolarDB Cluster of level-2 backup is a cross regional backup area."
  type        = string
  default     = null
}

variable "data_level2_backup_another_region_retention_period" {
  description = "PolarDB Cluster of level-2 backup cross region backup retention period. Valid values are `0`, `30 to 7300`, `-1`."
  type        = string
  default     = null
}

variable "log_backup_another_region_region" {
  description = "The region in which you want to store cross-region log backups."
  type        = string
  default     = null
}

variable "log_backup_another_region_retention_period" {
  description = "The retention period of cross-region log backups. Default value: `0`. Valid values are `0`, `30 to 7300`, `-1`."
  type        = string
  default     = null
}
