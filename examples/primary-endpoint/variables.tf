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

#alicloud_polardb_primary_endpoint
variable "primary_endpoint_ssl_enabled" {
  description = "Specifies how to modify the SSL encryption status. Valid values: `Disable`, `Enable`, `Update`."
  type        = string
  default     = "Disable"
}

variable "primary_endpoint_net_type" {
  description = "The network type of the endpoint address. Valid values: Public, Private, Inner."
  type        = string
  default     = "Public"
}

variable "primary_endpoint_ssl_auto_rotate" {
  description = "Specifies whether automatic rotation of SSL certificates is enabled. Valid values: `Enable`,`Disable`."
  type        = string
  default     = "Disable"
}

variable "primary_endpoint_description" {
  description = "The name of the endpoint."
  type        = string
  default     = null
}

variable "primary_endpoint_connection_prefix" {
  description = "The Prefix of the specified endpoint."
  type        = string
  default     = "testpolardbconn117431"
}

variable "primary_endpoint_port" {
  description = "Port of the specified primary endpoint. Valid values: 3000 to 5999."
  type        = string
  default     = null
}



