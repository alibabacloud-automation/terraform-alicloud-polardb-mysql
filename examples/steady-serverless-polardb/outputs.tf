
output "cluster_id" {
  description = "The id of the polardb cluster."
  value       = module.default.cluster_id
}

output "serverless_type" {
  description = "The edition of the PolarDB service."
  value       = module.default.serverless_type
}