resource "google_vmwareengine_cluster" "vmwareengine_clusters" {
  for_each = var.vmwareengine_clusters

  name            = each.value.name
  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy

  dynamic "autoscaling_settings" {
    for_each = each.value.autoscaling_settings != null ? [each.value.autoscaling_settings] : []
    content {
      dynamic "autoscaling_policies" {
        for_each = autoscaling_settings.value.autoscaling_policies
        content {
          autoscale_policy_id = autoscaling_policies.value.autoscale_policy_id
          dynamic "consumed_memory_thresholds" {
            for_each = autoscaling_policies.value.consumed_memory_thresholds != null ? [autoscaling_policies.value.consumed_memory_thresholds] : []
            content {
              scale_in  = consumed_memory_thresholds.value.scale_in
              scale_out = consumed_memory_thresholds.value.scale_out
            }
          }
          dynamic "cpu_thresholds" {
            for_each = autoscaling_policies.value.cpu_thresholds != null ? [autoscaling_policies.value.cpu_thresholds] : []
            content {
              scale_in  = cpu_thresholds.value.scale_in
              scale_out = cpu_thresholds.value.scale_out
            }
          }
          node_type_id   = autoscaling_policies.value.node_type_id
          scale_out_size = autoscaling_policies.value.scale_out_size
          dynamic "storage_thresholds" {
            for_each = autoscaling_policies.value.storage_thresholds != null ? [autoscaling_policies.value.storage_thresholds] : []
            content {
              scale_in  = storage_thresholds.value.scale_in
              scale_out = storage_thresholds.value.scale_out
            }
          }
        }
      }
      cool_down_period       = autoscaling_settings.value.cool_down_period
      max_cluster_node_count = autoscaling_settings.value.max_cluster_node_count
      min_cluster_node_count = autoscaling_settings.value.min_cluster_node_count
    }
  }

  dynamic "datastore_mount_config" {
    for_each = each.value.datastore_mount_config != null ? each.value.datastore_mount_config : []
    content {
      access_mode = datastore_mount_config.value.access_mode
      datastore   = datastore_mount_config.value.datastore
      datastore_network {
        connection_count = datastore_mount_config.value.datastore_network.connection_count
        mtu              = datastore_mount_config.value.datastore_network.mtu
        subnet           = datastore_mount_config.value.datastore_network.subnet
      }
      ignore_colocation = datastore_mount_config.value.ignore_colocation
      nfs_version       = datastore_mount_config.value.nfs_version
    }
  }

  dynamic "node_type_configs" {
    for_each = each.value.node_type_configs != null ? each.value.node_type_configs : []
    content {
      custom_core_count = node_type_configs.value.custom_core_count
      node_count        = node_type_configs.value.node_count
      node_type_id      = node_type_configs.value.node_type_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

