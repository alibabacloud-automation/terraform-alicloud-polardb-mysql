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

variable "storage_type" {
  description = "The storage type of the cluster. Enterprise storage type values are `PSL5`, `PSL4`. The standard version storage type values are `ESSDPL1`, `ESSDPL2`, `ESSDPL3`. The standard version only supports MySQL."
  type        = string
  default     = null
}

variable "storage_pay_type" {
  description = "The billing method of the storage. Valid values `PostPaid`, `PrePaid`."
  type        = string
  default     = null
}

variable "storage_space" {
  description = "Storage space charged by space (monthly package). Unit: GB. Valid values for PolarDB for MySQL Standard Edition: 20 to 32000. It is valid when pay_type are `PrePaid` ,`PostPaid`. Valid values for PolarDB for MySQL Enterprise Edition: 50 to 100000.It is valid when pay_type is `PrePaid`."
  type        = number
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

variable "source_resource_id" {
  description = "The ID of the source RDS instance or the ID of the source PolarDB cluster. This parameter is required only when CreationOption is set to MigrationFromRDS, CloneFromRDS, or CloneFromPolarDB."
  type        = string
  default     = null
}

variable "gdn_id" {
  description = "The ID of the global database network (GDN). This parameter is required if CreationOption is set to CreateGdnStandby."
  type        = string
  default     = null
}

variable "clone_data_point" {
  description = "The time point of data to be cloned. Valid values are `LATEST`,`BackupID`,`Timestamp`. If CreationOption is set to CloneFromRDS, the value of this parameter must be LATEST."
  type        = string
  default     = null
}

variable "serverless_type" {
  description = "The type of the serverless cluster. Valid values `AgileServerless`, `SteadyServerless`. This parameter is valid only for serverless clusters."
  type        = string
  default     = null
}

variable "serverless_steady_switch" {
  description = "Serverless steady-state switch. Valid values are `ON`, `OFF`. This parameter is valid only for serverless clusters.When serverless_steady_switch is `ON` and serverless_type is `SteadyServerless`, parameters `scale_min`, `scale_max`, `scale_ro_num_min` and `scale_ro_num_max` are all required."
  type        = string
  default     = null
}

variable "scale_min" {
  description = "The minimum number of PCUs per node for scaling. Valid values: 1 PCU to 31 PCUs. It is valid when serverless_type is `AgileServerless`. Valid values: 1 PCU to 8 PCUs.It is valid when serverless_type is `SteadyServerless`.· This parameter is valid only for serverless clusters."
  type        = number
  default     = null
}

variable "scale_max" {
  description = "The maximum number of PCUs per node for scaling. Valid values: 1 PCU to 32 PCUs. It is valid when serverless_type is `AgileServerless`. Valid values: 1 PCU to 8 PCUs.It is valid when serverless_type is `SteadyServerless`. This parameter is valid only for serverless clusters."
  type        = number
  default     = null
}

variable "scale_ro_num_min" {
  description = "The minimum number of read-only nodes for scaling. Valid values: 0 to 15 . It is valid when serverless_type is `AgileServerless`. Valid values: 0 to 7 .It is valid when serverless_type is `SteadyServerless`. This parameter is valid only for serverless clusters."
  type        = number
  default     = null
}

variable "scale_ro_num_max" {
  description = "The maximum number of read-only nodes for scaling. Valid values: 0 to 15. It is valid when serverless_type is `AgileServerless`. Valid values: 0 to 7. It is valid when serverless_type is `SteadyServerless`. This parameter is valid only for serverless clusters."
  type        = number
  default     = null
}

variable "allow_shut_down" {
  description = "Specifies whether to enable the no-activity suspension feature. Default value: false. Valid values are `true`, `false`. This parameter is valid only for serverless clusters."
  type        = string
  default     = null
}

variable "seconds_until_auto_pause" {
  description = "The detection period for No-activity Suspension. Valid values: 300 to 86,4005. Unit: seconds. The detection duration must be a multiple of 300 seconds. This parameter is valid only for serverless clusters."
  type        = number
  default     = null
}

variable "scale_ap_ro_num_min" {
  description = "Number of Read-only Columnar Nodes. Valid values: 0 to 7. This parameter is valid only for serverless clusters. This parameter is required when there are column nodes that support steady-state serverless."
  type        = number
  default     = null
}

variable "scale_ap_ro_num_max" {
  description = "Number of Read-only Columnar Nodes. Valid values: 0 to 7. This parameter is valid only for serverless clusters. This parameter is required when there are column nodes that support steady-state serverless."
  type        = number
  default     = null
}

variable "proxy_class" {
  description = "The specifications of the Standard Edition PolarProxy. Available parameters can refer to the latest docs"
  type        = string
  default     = null
}

variable "proxy_type" {
  description = "The type of PolarProxy. Default value: `OFF`. Valid values are `OFF`, `EXCLUSIVE` `GENERAL`."
  type        = string
  default     = null
}

variable "cluster_backup_retention_policy_on_cluster_deletion" {
  description = "The retention policy for the backup sets when you delete the cluster.  Valid values are `ALL`, `LATEST`, `NONE`."
  type        = string
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
  default     = "Private"
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

variable "log_backup_retention_period" {
  description = "The retention period of the log backups. Valid values are `3 to 7300`, `-1`."
  type        = string
  default     = null
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
