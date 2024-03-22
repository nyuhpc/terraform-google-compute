variable "hostname" {
  description = "Hostname of instances"
  type        = string
  default     = ""
}

variable "add_hostname_suffix" {
  description = "Adds a suffix to the hostname"
  type        = bool
  default     = true
}
variable "network_interfaces" {
  description = "network interface details for GCE, if any."
  default     = []
  type = list(object({
    network            = string
    subnetwork         = string
    subnetwork_project = string
    network_ip         = string

    # Ignore next 3 objects until we upgrade TF and can use optional attributes
    # access_config = list(object({
    #   nat_ip       = string
    #   network_tier = string
    # }))
    # ipv6_access_config = list(object({
    #   network_tier = string
    # }))
    # alias_ip_range = list(object({
    #   ip_cidr_range         = string
    #   subnetwork_range_name = string
    # }))
  }))
}

# variable "num_instances" {
#   description = "Number of instances to create. This value is ignored if static_ips is provided."
#   type        = number
#   default     = "1"
# }

variable "instance_template" {
  description = "Instance template self_link used to create compute instances"
  type        = string
}

variable "region" {
  type        = string
  description = "Region where the instances should be created."
  default     = null
}

variable "zone" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "hostname_suffix_separator" {
  type        = string
  description = "Separator character to compose hostname when add_hostname_suffix is set to true."
  default     = "-"
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection on this instance. Note: you must disable deletion protection before removing the resource, or the instance cannot be deleted and the Terraform run will not complete successfully."
  default     = false
}

variable "resource_policies" {
  description = "(Optional) A list of short names or self_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate. Currently a max of 1 resource policy is supported."
  type        = list(string)
  default     = []
}

variable "labels" {
  type        = map(string)
  description = "(Optional) Labels to override those from the template, provided as a map"
  default     = null
}