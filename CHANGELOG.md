## 3.1.0 (Unreleased)
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
