output "vmwareengine_clusters_id" {
  description = "Map of id values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no id are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vmwareengine_clusters_autoscaling_settings" {
  description = "Map of autoscaling_settings values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no autoscaling_settings are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => one(v.autoscaling_settings) if v.autoscaling_settings != null && length(v.autoscaling_settings) > 0 }
}
output "vmwareengine_clusters_create_time" {
  description = "Map of create_time values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no create_time are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "vmwareengine_clusters_datastore_mount_config" {
  description = "Map of datastore_mount_config values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no datastore_mount_config are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.datastore_mount_config if v.datastore_mount_config != null && length(v.datastore_mount_config) > 0 }
}
output "vmwareengine_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "vmwareengine_clusters_management" {
  description = "Map of management values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no management are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.management if v.management != null }
}
output "vmwareengine_clusters_name" {
  description = "Map of name values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no name are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vmwareengine_clusters_node_type_configs" {
  description = "Map of node_type_configs values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no node_type_configs are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.node_type_configs if v.node_type_configs != null && length(v.node_type_configs) > 0 }
}
output "vmwareengine_clusters_parent" {
  description = "Map of parent values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no parent are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "vmwareengine_clusters_state" {
  description = "Map of state values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no state are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "vmwareengine_clusters_uid" {
  description = "Map of uid values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no uid are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "vmwareengine_clusters_update_time" {
  description = "Map of update_time values across all vmwareengine_clusters, keyed the same as var.vmwareengine_clusters except keys with no update_time are omitted"
  value       = { for k, v in google_vmwareengine_cluster.vmwareengine_clusters : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

