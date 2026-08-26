output "mdm_public_ip" {
  value = aws_eip.headwind.public_ip
}

output "mdm_url" {
  description = "URL Headwind MDM (sslip.io) - accessible apres quelques minutes de demarrage"
  value       = "https://${aws_eip.headwind.public_ip}.sslip.io"
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "evidence_bucket" {
  value = aws_s3_bucket.evidence.id
}

output "kms_key_arn" {
  value = aws_kms_key.evidence.arn
}

output "guardduty_detector_id" {
  value = aws_guardduty_detector.this.id
}

output "security_alerts_topic_arn" {
  value = aws_sns_topic.security_alerts.arn
}
