output "s3_arn" {
  description = "AWS S3 bucket ARN"
  value       = aws_s3_bucket.test_bucket.arn
}