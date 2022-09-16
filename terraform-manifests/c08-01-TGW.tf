resource "aws_ec2_transit_gateway" "master-tgw" {
  description                     = "TGW with auto accept shared for prod, dev and shared environments"
  amazon_side_asn                 = 64512
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  
  tags = {
    Name = "Network-Prod-E1-TGW"
  }
 }

resource "aws_ram_resource_share" "main" {
  name                      = "tgw-master-share"
  allow_external_principals = false

  tags = {
    Name = "Master-TGW-ram-share"
  }
}
