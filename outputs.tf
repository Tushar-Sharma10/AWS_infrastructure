output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.mybucket.bucket
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.myvpc.id
}
