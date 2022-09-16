output "tgw" {
  description = "TGW ID for VPC attachments"
  value       = aws_ec2_transit_gateway.org_tgw.id
}

output "tgw_route_table" {
  description = "Map of route tables used for association and propagation"
  value = tomap({
    for k, rt in aws_ec2_transit_gateway_route_table.org_tgw : k => rt.id
  })
}
