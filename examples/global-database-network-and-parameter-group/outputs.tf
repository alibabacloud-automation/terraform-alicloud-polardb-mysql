output "db_endpoint_id" {
  description = "The ID of the endpoint."
  value       = module.default.db_endpoint_id
}

output "gdn_id" {
  description = "The ID of the GDN."
  value       = module.default.gdn_id
}

output "status" {
  description = "The status of the Global Database Network."
  value       = module.default.status
}