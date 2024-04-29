
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = module.default.cluster_id
}

output "creation_category" {
  description = "The edition of the PolarDB service."
  value       = module.default.creation_category
}