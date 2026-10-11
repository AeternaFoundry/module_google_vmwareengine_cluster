variable "vmwareengine_clusters" {
  description = <<EOT
Map of vmwareengine_clusters, attributes below
Required:
    - name
    - parent
Optional:
    - deletion_policy
    - autoscaling_settings (block):
        - autoscaling_policies (required, block):
            - autoscale_policy_id (required)
            - consumed_memory_thresholds (optional, block):
                - scale_in (required)
                - scale_out (required)
            - cpu_thresholds (optional, block):
                - scale_in (required)
                - scale_out (required)
            - node_type_id (required)
            - scale_out_size (required)
            - storage_thresholds (optional, block):
                - scale_in (required)
                - scale_out (required)
        - cool_down_period (optional)
        - max_cluster_node_count (optional)
        - min_cluster_node_count (optional)
    - datastore_mount_config (block):
        - access_mode (optional)
        - datastore (required)
        - datastore_network (required, block):
            - connection_count (optional)
            - mtu (optional)
            - subnet (required)
        - ignore_colocation (optional)
        - nfs_version (optional)
    - node_type_configs (block):
        - custom_core_count (optional)
        - node_count (required)
        - node_type_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    parent          = string
    deletion_policy = optional(string)
    autoscaling_settings = optional(object({
      autoscaling_policies = list(object({
        autoscale_policy_id = string
        consumed_memory_thresholds = optional(object({
          scale_in  = number
          scale_out = number
        }))
        cpu_thresholds = optional(object({
          scale_in  = number
          scale_out = number
        }))
        node_type_id   = string
        scale_out_size = number
        storage_thresholds = optional(object({
          scale_in  = number
          scale_out = number
        }))
      }))
      cool_down_period       = optional(string)
      max_cluster_node_count = optional(number)
      min_cluster_node_count = optional(number)
    }))
    datastore_mount_config = optional(list(object({
      access_mode = optional(string)
      datastore   = string
      datastore_network = object({
        connection_count = optional(number)
        mtu              = optional(number)
        subnet           = string
      })
      ignore_colocation = optional(bool)
      nfs_version       = optional(string)
    })))
    node_type_configs = optional(list(object({
      custom_core_count = optional(number)
      node_count        = number
      node_type_id      = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vmwareengine_clusters : (
        v.autoscaling_settings == null || (length(v.autoscaling_settings.autoscaling_policies) >= 1)
      )
    ])
    error_message = "Each autoscaling_policies list must contain at least 1 items"
  }
}

