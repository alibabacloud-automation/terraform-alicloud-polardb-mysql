Terraform module which creates polardb MySQL cluster service on Alibaba Cloud

terraform-alicloud-polardb-mysql
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create a polardb MySQL cluster service with `VPC` and `VSwitch` under Alibaba Cloud.

These types of resources are supported:


* [alicloud_polardb_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_cluster)
* [alicloud_polardb_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_database)
* [alicloud_polardb_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_account)
* [alicloud_polardb_endpoint](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_endpoint)
* [alicloud_polardb_endpoint_address](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_endpoint_address)
* [alicloud_polardb_account_privilege](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_account_privilege)
* [alicloud_polardb_backup_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_backup_policy)

## Usage

```hcl
module "example" {
  source = "terraform-alicloud-modules/polardb-mysql/alicloud"
  #alicloud_polardb_cluster
  create_cluster              = true
  db_version                  = "8.0"
  pay_type                    = "PostPaid"
  db_node_class               = "polar.mysql.x4.medium"
  polardb_cluster_description = "tf-test"
  modify_type                 = "Upgrade"
  renewal_status              = "Normal"
  tde_status                  = "Disabled"
  parameters = [
    {
      name  = "wait_timeout"
      value = "86"
    }
  ]
  deletion_lock                                       = 0
  imci_switch                                         = "OFF"
  sub_category                                        = "Exclusive"
  creation_category                                   = "Normal"
  hot_standby_cluster                                 = "ON"
  creation_option                                     = "Normal"
  cluster_backup_retention_policy_on_cluster_deletion = "LATEST"
  #alicloud_polardb_database
  create_database = true
  db_name         = "tf-dbname"
  #alicloud_polardb_account
  create_account   = true
  account_name     = "tf_test123"
  account_password = "tf_test123"
  account_type     = "Normal"
  #alicloud_polardb_endpoint
  create_endpoint    = true
  endpoint_type      = "Custom"
  read_write_mode    = "ReadOnly"
  auto_add_new_nodes = "Enable"
  net_type           = "Private"
  db_endpoint_description       = "test01"
  endpoint_port                 = "3308"
  #alicloud_polardb_endpoint_address
  create_endpoint_address = true
  connection_prefix       = "testpolardbconn"
  account_privilege       = "ReadOnly"
  endpoint_address_port   = "3306"
  #alicloud_polardb_account_privilege
  create_account_privilege = true
  #alicloud_polardb_backup_policy
  create_backup_policy                               = true
  preferred_backup_period                            = ["Tuesday", "Saturday"]
  preferred_backup_time                              = "02:00Z-03:00Z"
  data_level1_backup_retention_period                = "7"
  data_level2_backup_retention_period                = "60"
  backup_retention_policy_on_cluster_deletion        = "LATEST"
  backup_frequency                                   = "Normal"
  data_level1_backup_frequency                       = "Normal"
  data_level1_backup_time                            = "02:00Z-03:00Z"
  data_level1_backup_period                          = ["Tuesday", "Saturday"]
  data_level2_backup_period                          = ["Tuesday", "Saturday"]
  log_backup_retention_period                        = "7"
  data_level2_backup_another_region_region           = "cn-hangzhou"
  data_level2_backup_another_region_retention_period = "30"
  log_backup_another_region_region                   = "cn-hangzhou"
  log_backup_another_region_retention_period         = "30"
  #alicloud_polardb_global_database_network
  create_global_database_network      = true
  global_database_network_description = "test01"
  #alicloud_polardb_parameter_group
  create_parameter_group      = true
  parameter_group_name        = "test_group"
  db_type                     = "MySQL"
  parameter_group_db_version  = "8.0"
  parameter_group_parameters  = {
    name = "wait_timeout"
    value = "86"
  }
  parameter_group_description = "test01"
  #alicloud_polardb_primary_endpoint
  create_primary_endpoint            = true
  primary_endpoint_ssl_enabled       = "Disable"
  primary_endpoint_net_type          = "Public"
  primary_endpoint_ssl_auto_rotate   = "Disable"
  primary_endpoint_description       = "test01"
  primary_endpoint_connection_prefix = "testpolardbconn110"
  primary_endpoint_port              = "3307"
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/complete)
* [clone-from-polardb example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/clone-from-polardb)
* [clone-from-rds example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/clone-from-rds)
* [migration-from-rds example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/migration-from-rds)
* [multimaster-polardb example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/multimaster-polardb)
* [se-normal-polardb example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/se-normal-polardb)
* [serverless-polardb example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/serverless-polardb)
* [steady-serverless-polardb example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/steady-serverless-polardb)
* [global-database-network-and-parameter-group example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/global-database-network-and-parameter-group)
* [primary-endpoint example](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/primary-endpoint)
## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.130.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.130.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
