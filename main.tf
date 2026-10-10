resource "aws_dx_public_virtual_interface" "dx_public_virtual_interfaces" {
  for_each = var.dx_public_virtual_interfaces

  address_family        = each.value.address_family
  bgp_asn               = each.value.bgp_asn
  connection_id         = each.value.connection_id
  name                  = each.value.name
  route_filter_prefixes = each.value.route_filter_prefixes
  vlan                  = each.value.vlan
  amazon_address        = each.value.amazon_address
  bgp_auth_key          = each.value.bgp_auth_key
  customer_address      = each.value.customer_address
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
}

