## [3.2.1](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/compare/v3.2.0...v3.2.1) (2025-12-02)

## 3.3.0 (Unreleased)
## 3.2.0 (2024-05-21)

- module/alicloud_polardb_cluster: support attributes db_node_id,hot_replica_mode,default_time_zone,lower_case_table_names,db_node_num,loose_polar_log_bin,target_db_revision_version_code,planned_end_time,planned_start_time,from_time_service,upgrade_type; module/alicloud_polardb_cluster_endpoint: support new resource.[GH-11](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/11)

## 3.1.0 (2024-05-13)

ENHANCEMENTS:

- module/alicloud_polardb_endpoint: support attributes db_endpoint_description,endpoint_port;module/alicloud_polardb_endpoint_address: support port;module/alicloud_polardb_global_database_network : support new resource;module/alicloud_polardb_parameter_group : support new resource;module/alicloud_polardb_primary_endpoint : support new resource. [GH-12](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/12)


## 3.0.0 (2024-04-30)

ENHANCEMENTS:

- module: support added attribute of resource resource_alicloud_polardb_cluster、resource_alicloud_polardb_backup_policy. [GH-10](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/10)

## 2.3.0 (2024-02-28)

ENHANCEMENTS:

- added attribute log_backup_retention_period of backup_policy.[GH-7](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/7)

## 2.2.0 (2023-12-05)

ENHANCEMENTS:

- Terraform module supports cluster protection locks [GH-5](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/5)


## 2.1.0 (2023-12-04)

ENHANCEMENTS:

- Upgrade variable encrypt_new_tables default value deleting
[GH-4](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/4)

## 2.0.0 (2023-11-01)

ENHANCEMENTS:

- Upgrade variable parameters type to list(map(string)) from map(string); Adds more variables for backup_policy resource: data_level1_backup_retension_period、data_level2_backup_retenation_period、backup_retention_policy_on_cluster_deleteion、backup_frequency、data_level1_backup_freque、data_llevel_backup_time、data_livel_backup _period、data_levell_backup _period. [GH-3](https://github.com/alibabacloud-automation/terraform-alicloud-polardb-mysql/pull/3)
  
## 1.0.0 (2022-03-30)

- Project initialization. [GH-1](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/pull/1)
