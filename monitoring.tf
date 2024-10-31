resource "aws_cloudwatch_metric_alarm" "build_failure_alarm" {
  alarm_name          = "CodeBuildFailureAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "FailedBuilds"
  namespace           = "AWS/CodeBuild"
  period              = "60"
  statistic           = "Sum"
  threshold           = "0"
  dimensions = {
    ProjectName = "TerraformBuild"
  }
  alarm_actions = [aws_sns_topic.codebuild_notifications.arn]
}

resource "aws_sns_topic" "codebuild_notifications" {
  name = "CodeBuildNotifications"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.codebuild_notifications.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
