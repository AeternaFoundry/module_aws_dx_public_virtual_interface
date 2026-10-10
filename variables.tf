variable "dx_public_virtual_interfaces" {
  description = <<EOT
Map of dx_public_virtual_interfaces, attributes below
Required:
    - address_family
    - bgp_asn
    - connection_id
    - name
    - route_filter_prefixes
    - vlan
Optional:
    - amazon_address
    - bgp_auth_key
    - customer_address
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    address_family        = string
    bgp_asn               = number
    connection_id         = string
    name                  = string
    route_filter_prefixes = set(string)
    vlan                  = number
    amazon_address        = optional(string)
    bgp_auth_key          = optional(string)
    customer_address      = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dx_public_virtual_interfaces : (
        v.vlan >= 1 && v.vlan <= 4094
      )
    ])
    error_message = "must be between 1 and 4094"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

