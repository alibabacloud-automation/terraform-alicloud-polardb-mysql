#alicloud_polardb_cluster
variable "db_node_class" {
  description = "The db_node_class of cluster node."
  type        = string
  default     = "polar.mysql.x4.medium"
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = "polardb_cluster_steady_serverless_description"
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

variable "deletion_lock" {
  description = "Valid values are 0, 1. 1 means to open the cluster protection lock, 0 means to close the cluster protection lock. Cannot modify after created when pay_type is Prepaid."
  type        = number
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
  default     = "OFF"
}

variable "sub_category" {
  description = "The category of the cluster. Valid values are `Exclusive`, `General`. Only MySQL supports.If the specifications between exclusive and shared are mutually matched, sub_category is a required field."
  type        = string
  default     = null
}

variable "creation_category" {
  description = "The edition of the PolarDB service. Valid values are `Normal`,`Basic`,`ArchiveNormal`,`NormalMultimaster`,`SENormal`."
  type        = string
  default     = "Normal"
}

variable "storage_type" {
  description = "The storage type of the cluster. Enterprise storage type values are `PSL5`, `PSL4`. The standard version storage type values are `ESSDPL1`, `ESSDPL2`, `ESSDPL3`. The standard version only supports MySQL."
  type        = string
  default     = "PSL4"
}

variable "hot_standby_cluster" {
  description = "Whether to enable the hot standby cluster. Valid values are `ON`, `OFF`. Only MySQL supports."
  type        = string
  default     = "ON"
}

variable "creation_option" {
  description = "The method that is used to create a cluster. Valid values are `Normal`,`CloneFromPolarDB`,`CloneFromRDS`,`MigrationFromRDS`,`CreateGdnStandby`. The default value is Normal. If DBType is set to MySQL and DBVersion is set to 5.6 or 5.7, this parameter can be set to CloneFromRDS or MigrationFromRDS. If DBType is set to MySQL and DBVersion is set to 8.0, this parameter can be set to CreateGdnStandby."
  type        = string
  default     = "Normal"
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

variable "cluster_backup_retention_policy_on_cluster_deletion" {
  description = "The retention policy for the backup sets when you delete the cluster.  Valid values are `ALL`, `LATEST`, `NONE`."
  type        = string
  default     = "LATEST"
}