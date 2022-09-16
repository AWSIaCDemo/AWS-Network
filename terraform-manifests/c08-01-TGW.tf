#################
# Transit Gateway
#################
resource "aws_ec2_transit_gateway" "this" {

  description                     = coalesce(var.description, var.name)
  amazon_side_asn                 = var.amazon_side_asn
  default_route_table_association = var.enable_default_route_table_association ? "enable" : "disable"
  default_route_table_propagation = var.enable_default_route_table_propagation ? "enable" : "disable"
  auto_accept_shared_attachments  = var.enable_auto_accept_shared_attachments ? "enable" : "disable"
  vpn_ecmp_support                = var.enable_vpn_ecmp_support ? "enable" : "disable"
  dns_support                     = var.enable_dns_support ? "enable" : "disable"

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}

#########################
# Route table and routes
#########################
resource "aws_ec2_transit_gateway_route_table" "this" {

  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}


// VPC attachment routes
resource "aws_ec2_transit_gateway_route" "this" {

  destination_cidr_block = var.vpc_attachments["vpc0"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc0.id
}

resource "aws_ec2_transit_gateway_route" "this_vpc1" {

  destination_cidr_block = var.vpc_attachments["vpc1"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc1.id
}

resource "aws_ec2_transit_gateway_route" "this_vpc2" {

  destination_cidr_block = var.vpc_attachments["vpc2"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc2.id
}

resource "aws_ec2_transit_gateway_route" "this_vpc3" {

  destination_cidr_block = var.vpc_attachments["vpc3"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc3.id
}

resource "aws_ec2_transit_gateway_route" "this_vpc4" {

  destination_cidr_block = var.vpc_attachments["vpc4"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc4.id
}

resource "aws_ec2_transit_gateway_route" "this_vpc5" {

  destination_cidr_block = var.vpc_attachments["vpc5"].vpc_cidr

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc5.id
}



resource "aws_ec2_transit_gateway_route_table_association" "this" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc0.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc0.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route_table_association" "this_vpc1" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this_vpc1" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route_table_association" "this_vpc2" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this_vpc2" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route_table_association" "this_vpc3" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this_vpc3" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc3.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route_table_association" "this_vpc4" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc4.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this_vpc4" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc4.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}


resource "aws_ec2_transit_gateway_route_table_association" "this_vpc5" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc5.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this_vpc5" {

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this_vpc5.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

###########################################################
# VPC Attachments, route table association and propagation
###########################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc0" {

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc0"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc0"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc0"].name)
    },
    var.tags
  )
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc1" {

  provider = aws.vpc1

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc1"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc1"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc1"].name)
    },
    var.tags
  )
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc2" {

  provider = aws.vpc2

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc2"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc2"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc2"].name)
    },
    var.tags
  )
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc3" {

  provider = aws.vpc3

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc3"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc3"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc3"].name)
    },
    var.tags
  )
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc4" {

  provider = aws.vpc4

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc4"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc4"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc4"].name)
    },
    var.tags
  )
}


resource "aws_ec2_transit_gateway_vpc_attachment" "this_vpc5" {

  provider = aws.vpc5

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_attachments["vpc5"].vpc_id
  subnet_ids         = var.vpc_attachments["vpc5"].subnet_ids

  dns_support                                     = "enable"
  ipv6_support                                    = "enable"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(
    {
      Name = format("%s-%s", var.name, var.vpc_attachments["vpc5"].name)
    },
    var.tags
  )
}
