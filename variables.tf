#alicloud_polardb_cluster
variable "create_cluster" {
  description = "Controls if polardb cluster should be created"
  type        = bool
  default     = false
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch DB instances in one VPC."
  type        = string
  default     = ""
}

variable "zone_id" {
  description = "The Zone to launch the DB cluster. it supports multiple zone."
  type        = string
  default     = ""
}

variable "db_version" {
  description = "The specification of the db version."
  type        = string
  default     = "8.0"
}

variable "pay_type" {
  description = "The specification of the pay type."
  type        = string
  default     = "PostPaid"
}

variable "db_node_class" {
  description = "The db_node_class of cluster node."
  type        = string
  default     = "polar.mysql.x4.medium"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = ""
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

variable "resource_group_id" {
  description = "The ID of resource group which the PolarDB cluster belongs. If not specified, then it belongs to the default resource group."
  type        = string
  default     = null
}

variable "maintain_time" {
  description = "Maintainable time period format of the instance: HH:MMZ-HH:MMZ (UTC time)"
  type        = string
  default     = null
}

variable "collector_status" {
  description = "Specifies whether to enable or disable SQL data collector. Valid values are Enable, Disabled."
  type        = string
  default     = "Disabled"
}

variable "parameters" {
  description = "Set of parameters needs to be set after DB cluster was launched. "
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
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

#alicloud_polardb_database
variable "create_database" {
  description = "Controls if database should be created"
  type        = bool
  default     = false
}

variable "db_cluster_id" {
  description = "The Id of cluster that can run database."
  type        = string
  default     = ""
}

variable "db_name" {
  description = "Name of the database requiring a uniqueness check."
  type        = string
  default     = ""
}

variable "db_character_set_name" {
  description = "Character set.default is utf8."
  type        = string
  default     = "utf8"
}

variable "db_description" {
  description = "Database description."
  type        = string
  default     = ""
}

#alicloud_polardb_account
variable "create_account" {
  description = "Controls if account should be created"
  type        = bool
  default     = false
}

variable "account_description" {
  description = "The specification of account description."
  type        = string
  default     = ""
}

variable "account_name" {
  description = "Operation account requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 16 characters."
  type        = string
  default     = ""
}

variable "account_password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  type        = string
  default     = ""
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

variable "account_type" {
  description = "Account type, Valid values are Normal, Super, Default to Normal."
  type        = string
  default     = "Normal"
}

#alicloud_polardb_endpoint
variable "create_endpoint" {
  description = "Controls if endpoint should be created"
  type        = bool
  default     = false
}

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
  default     = "Disable"
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
  default     = "Public"
}

variable "ssl_auto_rotate" {
  description = "Specifies whether automatic rotation of SSL certificates is enabled. Valid values: Enable,Disable."
  type        = string
  default     = "Disable"
}

#alicloud_polardb_endpoint_address
variable "create_endpoint_address" {
  description = "Controls if endpoint address should be created"
  type        = bool
  default     = false
}

variable "connection_prefix" {
  description = "The Prefix of the specified endpoint."
  type        = string
  default     = ""
}

#alicloud_polardb_account_privilege
variable "create_account_privilege" {
  description = "Controls if account privilege should be created"
  type        = bool
  default     = false
}

variable "account_privilege" {
  description = "The privilege of one account access database. Valid values: ReadOnly, ReadWrite, DMLOnly, DDLOnly. Default to ReadOnly."
  type        = string
  default     = "ReadOnly"
}

#alicloud_polardb_backup_policy
variable "create_backup_policy" {
  description = "Controls if backup policy should be created"
  type        = bool
  default     = false
}

variable "preferred_backup_period" {
  description = "PolarDB Cluster backup period. Valid values: Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday. Default to ['Tuesday','Thursday', 'Saturday']."
  type        = set(string)
  default     = null
}

variable "preferred_backup_time" {
  description = "PolarDB Cluster backup time, in the format of HH:mmZ- HH:mmZ. Time setting interval is one hour. Default to '02:00Z-03:00Z'. China time is 8 hours behind it."
  type        = string
  default     = null
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

variable "deletion_lock"{
  description = "Valid values are 0, 1. 1 means to open the cluster protection lock, 0 means to close the cluster protection lock. Cannot modify after created when pay_type is Prepaid."
  type = number
  default = null
}

variable "log_backup_retention_period"{
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  type        = string
  default     = null
}