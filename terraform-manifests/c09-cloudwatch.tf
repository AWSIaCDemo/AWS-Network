resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "Network-Account-Cloudwatch-Dashboard"
  
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 8,
      "y": 0,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "NetworkIn"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "us-east-1",
        "title": "EC2|Network In"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 0,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "NetworkOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "us-east-1",
        "title": "EC2|Network Out"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 12,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/TransitGateway",
            "BytesDropCountBlackhole"
          ],
          [
             "AWS/TransitGateway",
            "BytesDropCountNoRoute"
          ],
          [
            "AWS/TransitGateway",
            "BytesIn"
          ],
          [
            "AWS/TransitGateway",
            "BytesOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "us-east-1",
        "title": "Transit Gateway|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 12,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/VPN",
            "TunnelState"
          ],
          [
             "AWS/VPN",
            "TunnelDataIn"
          ],
          [
            "AWS/VPN",
            "TunnelDataOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "us-east-1",
        "title": "VPN|Main Stats"
      }
    }
  ]    
}
EOF

}

#resource "aws_sns_topic" "cloud_watch_alarm_topic" {
# count        = length(var.alarm_type)
#  name         = "cloud-watch-${var.alarm_type[count.index]}-alarm-topic"
#  display_name = "CW Alarm | ${var.alarm_type[count.index]} | ${terraform.workspace}"
#  tags         = local.common_tags
#}

#resource "aws_sns_topic_subscription" "cloud_watch_alarm_email_target" {
#  count     = length(var.alarm_type)
 # topic_arn = aws_sns_topic.cloud_watch_alarm_topic[count.index].arn
#  protocol  = "email"
#  endpoint  = "AWS-CloudWatch-prlearn85@gmail.com" 
#} 

#resource "aws_cloudwatch_metric_alarm" "cw_alarm" {
#  count                     = length(var.alarm_type)
 # alarm_name                = "${var.alarm_type[count.index]}-alarm"
 # comparison_operator       = "GreaterThanOrEqualToThreshold"
#  evaluation_periods        = "2"
#  metric_name               = var.metric_name[count.index] 
#  namespace                 = var.name_space[count.index]
#  period                    = var.period[count.index]
#  statistic                 = var.statistic[count.index]
 # threshold                 = var.threshold[count.index]
 # alarm_description         = "This metric monitors ${var.alarm_type[count.index]}"
 # insufficient_data_actions = []
  
#  actions_enabled           = "true"
 # alarm_actions             = [aws_sns_topic.cloud_watch_alarm_topic[count.index].arn]
 # tags                      = local.common_tags
#}
