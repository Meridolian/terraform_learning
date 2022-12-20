output "buckets" {
  value = {
    for k, bd in module.s3_buckets : k => bd.s3_bucket_arn
  }
}