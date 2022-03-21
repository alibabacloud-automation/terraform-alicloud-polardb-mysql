Terraform module which creates polardb MySQL cluster service on Alibaba Cloud

terraform-alicloud-polardb-mysql
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云自动化创建和管理Polardb MySQL集群，并为之配置账号、数据库、网络连接等。

本 Module 支持创建以下资源:


* [alicloud_polardb_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_cluster)
* [alicloud_polardb_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_database)
* [alicloud_polardb_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_account)
* [alicloud_polardb_endpoint](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_endpoint)
* [alicloud_polardb_endpoint_address](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_endpoint_address)
* [alicloud_polardb_account_privilege](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_account_privilege)
* [alicloud_polardb_backup_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_backup_policy)

## 用法

```hcl
module "example" {
  source                        = "terraform-alicloud-modules/polardb-mysql/alicloud"
  #alicloud_polardb_cluster
  create_cluster                = true
  db_version                    = "8.0" 
  pay_type                      = "PostPaid"
  db_node_class                 = "polar.mysql.x4.medium"
  polardb_cluster_description   = "tf-test"
  modify_type                   = "Upgrade"
  renewal_status                = "Normal"
  tde_status                    = "Disabled"
  encrypt_new_tables            = "OFF"
  parameters                    = {
    name = "wait_timeout"
    value = "86"
  }
  #alicloud_polardb_database
  create_database               = true
  db_name                       = "tf-dbname"
  #alicloud_polardb_account
  create_account                = true
  account_name                  = "tf_test123" 
  account_password              = "tf_test123"
  account_type                  = "Normal"
  #alicloud_polardb_endpoint
  create_endpoint               = true
  endpoint_type                 = "Custom"
  read_write_mode               = "ReadOnly"
  auto_add_new_nodes            = "Enable"
  net_type                      = "Public"
  #alicloud_polardb_endpoint_address
  create_endpoint_address       = true
  connection_prefix             = "testpolardbconn"
  account_privilege             = "ReadOnly"
  #alicloud_polardb_account_privilege
  create_account_privilege      = true
  #alicloud_polardb_backup_policy
  create_backup_policy          = true
}
```

## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-polardb-mysql/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.130.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.130.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
