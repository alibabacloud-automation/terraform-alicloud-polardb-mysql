data "alicloud_polardb_node_classes" "default" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "terraform-example"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_polardb_node_classes.default.classes[0].zone_id
  vswitch_name = "terraform-example"
}

module "default" {
  source = "../.."
  #alicloud_polardb_cluster
  create_cluster              = true
  db_version                  = "8.0"
  vswitch_id                  = alicloud_vswitch.default.id
  db_node_class               = var.db_node_class
  polardb_cluster_description = var.polardb_cluster_description
  modify_type                 = var.modify_type
  db_node_count               = var.db_node_count
  renewal_status              = var.renewal_status
  auto_renew_period           = var.auto_renew_period
  period                      = var.period
  security_ips                = var.security_ips
  maintain_time               = var.maintain_time
  collector_status            = var.collector_status
  deletion_lock               = var.deletion_lock
  parameters = [
    {
      name  = "wait_timeout"
      value = "86"
    }
  ]
  tde_status         = var.tde_status
  encrypt_new_tables = var.encrypt_new_tables
  security_group_ids = var.security_group_ids
  tags = {
    Created = "TF"
  }
  imci_switch                                         = var.imci_switch
  sub_category                                        = var.sub_category
  creation_category                                   = var.creation_category
  storage_type                                        = var.storage_type
  hot_standby_cluster                                 = var.hot_standby_cluster
  creation_option                                     = var.creation_option
  serverless_type                                     = var.serverless_type
  scale_min                                           = var.scale_min
  scale_max                                           = var.scale_max
  scale_ro_num_min                                    = var.scale_ro_num_min
  scale_ro_num_max                                    = var.scale_ro_num_max
  allow_shut_down                                     = var.allow_shut_down
  seconds_until_auto_pause                            = var.seconds_until_auto_pause
  cluster_backup_retention_policy_on_cluster_deletion = var.cluster_backup_retention_policy_on_cluster_deletion
}