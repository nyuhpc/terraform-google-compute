locals {
  hostname      = var.hostname == "" ? "default" : var.hostname
  num_instances = 1

  project_id = length(regexall("/projects/([^/]*)", var.instance_template)) > 0 ? flatten(regexall("/projects/([^/]*)", var.instance_template))[0] : null

  # Read the network interface info from the variables and override the template
  network_interfaces = var.network_interfaces
}

###############
# Data Sources
###############

data "google_compute_zones" "available" {
  project = local.project_id
  region  = var.region
}

data "google_compute_instance_template" "tpl" {
  name    = var.instance_template
  project = local.project_id
}

#############
# Instances
#############

resource "google_compute_instance_from_template" "compute_instance" {
  provider            = google
  count               = local.num_instances
  name                = var.add_hostname_suffix ? format("%s%s%s", local.hostname, var.hostname_suffix_separator, format("%03d", count.index + 1)) : local.hostname
  project             = local.project_id
  zone                = var.zone == null ? data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)] : var.zone
  deletion_protection = var.deletion_protection
  resource_policies   = var.resource_policies
  labels              = var.labels

  dynamic "network_interface" {
    for_each = local.network_interfaces

    content {
      network            = network_interface.value.network
      subnetwork         = network_interface.value.subnetwork
      subnetwork_project = network_interface.value.subnetwork_project
      network_ip         = network_interface.value.network_ip
      # Ignore these dynamic blocks until we upgrade TF and can use optional attributes
      #   dynamic "access_config" {
      #     for_each = network_interface.value.access_config
      #     content {
      #       nat_ip       = access_config.value.nat_ip
      #       network_tier = access_config.value.network_tier
      #     }
      #   }

      #   dynamic "ipv6_access_config" {
      #     for_each = network_interface.value.ipv6_access_config
      #     content {
      #       network_tier = ipv6_access_config.value.network_tier
      #     }
      #   }

      #   dynamic "alias_ip_range" {
      #     for_each = network_interface.value.alias_ip_range
      #     content {
      #       ip_cidr_range         = alias_ip_range.value.ip_cidr_range
      #       subnetwork_range_name = alias_ip_range.value.subnetwork_range_name
      #     }
      #   }
    }
  }

  source_instance_template = var.instance_template

  depends_on = [
    data.google_compute_instance_template.tpl
  ]
}
