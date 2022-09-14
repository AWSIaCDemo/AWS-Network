resource "aws_route53_zone" "flink_aws" {
  name = "flinkaws.com"

  tags = {
    Environment = "core"
  }
}

resource "aws_route53_record" "nameservers" {
  allow_overwrite = true
  name            = "flinkaws.com"
  ttl             = 3600
  type            = "NS"
  zone_id         = aws_route53_zone.flink_aws.zone_id

  records = aws_route53_zone.flink_aws.name_servers
}
