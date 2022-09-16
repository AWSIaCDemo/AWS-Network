resource "aws_ec2_transit_gateway" "Network-Prod-E1-TGW" {
  description                     = "Network-transit-gateway"
  amazon_side_asn                 = 64512
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  }
