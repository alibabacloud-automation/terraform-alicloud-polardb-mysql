#alicloud_polardb_cluster
variable "db_node_class" {
  description = "The db_node_class of cluster node."
  type        = string
  default     = "polar.mysql.x4.medium"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = "cluster_endpoint_description"
}

variable "modify_type" {
  description = "Use as db_node_class change class, define upgrade or downgrade. Default value: `Upgrade`. Valid values are Upgrade, Downgrade, Default to Upgrade."
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
  description = "The duration that you will buy DB cluster (in month). It is valid when pay_type is PrePaid. Valid values: [1~9], 12, 24, 36, Default to 1."
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
  description = "Specifies whether to enable or disable SQL data collector. Default value: `Disabled`. Valid values are Enable, Disabled."
  type        = string
  default     = null
}

variable "parameters" {
  description = "Set of parameters needs to be set after DB cluster was launched. "
  type        = list(map(string))
  default     = []
}

#alicloud_polardb_cluster_endpoint
variable "create_cluster_endpoint" {
  description = "Controls if cluster endpoint should be created."
  type        = bool
  default     = false
}

variable "cluster_endpoint_private_connection_prefix" {
  description = "The private network address prefix of the cluster endpoint."
  type        = string
  default     = null
}

variable "cluster_endpoint_private_port" {
  description = "Private port of the cluster endpoint. Valid values: 3000 to 5999."
  type        = string
  default     = null
}

variable "cluster_endpoint_description" {
  description = "The name of the cluster endpoint."
  type        = string
  default     = null
}

variable "cluster_endpoint_nodes" {
  description = "Node id list for cluster endpoint configuration. Default is all nodes."
  type        = set(string)
  default     = null
}

variable "cluster_endpoint_read_write_mode" {
  description = "Read or write mode. Default value: `ReadWrite`. Valid values are ReadWrite, ReadOnly."
  type        = string
  default     = "ReadWrite"
}

variable "cluster_endpoint_auto_add_new_nodes" {
  description = "Whether the new node automatically joins the default cluster endpoint address. Default value: `Disable`. Valid values are Enable, Disable."
  type        = string
  default     = "Disable"
}

variable "cluster_endpoint_config" {
  description = "The advanced settings of the cluster endpoint of Apsara PolarDB clusters are in JSON format."
  type        = map(any)
  default     = {}
}

variable "cluster_endpoint_ssl_enabled" {
  description = "Specifies how to modify the SSL encryption status. Default value: `Disable`. Valid values: Disable, Enable, Update."
  type        = string
  default     = "Disable"
}

variable "cluster_endpoint_net_type" {
  description = "The network type of the cluster endpoint address. Default value: `Private`. Valid values: Public, Private, Inner."
  type        = string
  default     = "Private"
}

variable "cluster_endpoint_ssl_auto_rotate" {
  description = "Specifies whether automatic rotation of SSL certificates is enabled. Default value: `Disable`. Valid values: Enable,Disable."
  type        = string
  default     = "Disable"
}

#alicloud_polardb_cluster_endpoint_address
variable "create_cluster_endpoint_address" {
  description = "Controls if cluster endpoint address should be created."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_connection_prefix" {
  description = "The public network address prefix of the cluster endpoint."
  type        = string
  default     = null
}

variable "cluster_endpoint_public_port" {
  description = "Public port of the cluster endpoint. Valid values: 3000 to 5999."
  type        = string
  default     = null
}