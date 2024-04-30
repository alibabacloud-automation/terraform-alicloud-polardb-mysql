output "cluster_endpoint_id" {
  description = "The current instance connection resource ID. Composed of instance ID and connection string with format."
  value       = module.default.cluster_endpoint_id
}

output "cluster_endpoint_ssl_connection_string" {
  description = "The SSL connection string."
  value       = module.default.cluster_endpoint_ssl_connection_string
}

output "cluster_endpoint_type" {
  description = "Type of endpoint."
  value       = module.default.cluster_endpoint_type
}
output "cluster_db_endpoint_id" {
  description = "Type of endpoint."
  value       = module.default.cluster_endpoint_db_endpoint_id
}
output "cluster_ssl_certificate_url" {
  description = "Type of endpoint."
  value       = module.default.cluster_endpoint_ssl_certificate_url
}
output "cluster_ssl_expire_time" {
  description = "Type of endpoint."
  value       = module.default.cluster_endpoint_ssl_expire_time
}
output "cluster_endpoint_address_id" {
  description = "The id of the polardb endpoint address."
  value       = module.default.cluster_endpoint_address_id
}

output "cluster_endpoint_address_port" {
  description = "Connection cluster or endpoint port."
  value       = module.default.cluster_endpoint_address_port
}

output "cluster_endpoint_address_connection_string" {
  description = "Connection cluster or endpoint string."
  value       = module.default.cluster_endpoint_address_connection_string
}

output "cluster_endpoint_address_ip_address" {
  description = "The ip address of connection string."
  value       = module.default.cluster_endpoint_address_ip_address
}