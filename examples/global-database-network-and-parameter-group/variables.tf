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
  description = "Set of parameters needs to be set after DB cluster was launched. "
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

#alicloud_polardb_global_database_network
variable "global_database_network_description" {
  description = "The description of the Global Database Network."
  type        = string
  default     = ""
}

#alicloud_polardb_parameter_group
variable "parameter_group_name" {
  description = "The name of the parameter template. It must be 8 to 64 characters in length, and can contain letters, digits, and underscores (_). It must start with a letter and cannot contain Chinese characters."
  type        = string
  default     = "parameter_name"
}

variable "db_type" {
  description = "The type of the database engine. Only `MySQL` is supported."
  type        = string
  default     = "MySQL"
}

variable "parameter_group_db_version" {
  description = "he version number of the database engine. Valid values: `5.6`, `5.7`, `8.0`."
  type        = string
  default     = "8.0"
}

variable "parameter_group_parameters" {
  description = "The parameter template. param_name: The name of a parameter in the parameter template. param_value: The value of a parameter in the parameter template."
  type        = list(map(string))
  default     = []
}

variable "parameter_group_description" {
  description = "The description of the parameter template. It must be 0 to 200 characters in length."
  type        = string
  default     = null
}