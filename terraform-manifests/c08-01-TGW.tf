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

# Requires RAM enabled to share with AWS :
# enable in master account with 'aws ram enable-sharing-with-aws-organization'
resource "aws_ram_principal_association" "master" {
  principal          = var.master_arn
  resource_share_arn = aws_ram_resource_share.main.arn
}

# Requires RAM enabled to share with AWS 
resource "aws_ram_resource_association" "tgw" {
  resource_arn       = aws_ec2_transit_gateway.master_tgw.arn
  resource_share_arn = aws_ram_resource_share.main.arn
}

resource "aws_ec2_transit_gateway_route_table" "master_tgw" {
  for_each           = toset(var.tgw_route_tables)
  transit_gateway_id = aws_ec2_transit_gateway.master_tgw.id
  tags = {
    Name = each.value
  }
}

resource "aws_ec2_transit_gateway_route" "blackhole_route" {
  for_each                       = aws_ec2_transit_gateway_route_table.master_tgw
  destination_cidr_block         = var.cidr
  blackhole                      = true
  transit_gateway_route_table_id = each.value.id
}

resource "aws_ec2_transit_gateway_route" "default_route" {
  for_each                       = aws_ec2_transit_gateway_route_table.master_tgw
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.inspection_attachment
  blackhole                      = false
  transit_gateway_route_table_id = each.value.id
}

resource "aws_ec2_transit_gateway_route" "default_route_ipv6" {
  for_each                       = aws_ec2_transit_gateway_route_table.master_tgw
  destination_cidr_block         = "::/0"
  transit_gateway_attachment_id  = var.inspection_attachment
  blackhole                      = false
  transit_gateway_route_table_id = each.value.id
}
