# Compute Instance From Template

This module is used to create compute instances (and only compute instances) using
[google_compute_instance_from_template](https://www.terraform.io/docs/providers/google/r/compute_instance_from_template), with no instance groups.

## Usage

See the [simple](https://github.com/terraform-google-modules/terraform-google-vm/tree/master/examples/compute_instance/simple) for a usage example.

## Testing


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.90.1 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.90.1 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.90.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance_from_template.compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_from_template) | resource |
| [google_compute_instance_template.tpl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_instance_template) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_hostname_suffix"></a> [add\_hostname\_suffix](#input\_add\_hostname\_suffix) | Adds a suffix to the hostname | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection on this instance. Note: you must disable deletion protection before removing the resource, or the instance cannot be deleted and the Terraform run will not complete successfully. | `bool` | `false` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of instances | `string` | `""` | no |
| <a name="input_hostname_suffix_separator"></a> [hostname\_suffix\_separator](#input\_hostname\_suffix\_separator) | Separator character to compose hostname when add\_hostname\_suffix is set to true. | `string` | `"-"` | no |
| <a name="input_instance_template"></a> [instance\_template](#input\_instance\_template) | Instance template self\_link used to create compute instances | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | (Optional) Labels to override those from the template, provided as a map | `map(string)` | `null` | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | network interface details for GCE, if any. | <pre>list(object({<br>    network            = string<br>    subnetwork         = string<br>    subnetwork_project = string<br>    network_ip         = string<br><br>    # Ignore next 3 objects until we upgrade TF and can use optional attributes<br>    # access_config = list(object({<br>    #   nat_ip       = string<br>    #   network_tier = string<br>    # }))<br>    # ipv6_access_config = list(object({<br>    #   network_tier = string<br>    # }))<br>    # alias_ip_range = list(object({<br>    #   ip_cidr_range         = string<br>    #   subnetwork_range_name = string<br>    # }))<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the instances should be created. | `string` | `null` | no |
| <a name="input_resource_policies"></a> [resource\_policies](#input\_resource\_policies) | (Optional) A list of short names or self\_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate. Currently a max of 1 resource policy is supported. | `list(string)` | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_available_zones"></a> [available\_zones](#output\_available\_zones) | List of available zones in region |
| <a name="output_instances_details"></a> [instances\_details](#output\_instances\_details) | List of all details for compute instances |
| <a name="output_instances_self_links"></a> [instances\_self\_links](#output\_instances\_self\_links) | List of self-links for compute instances |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->