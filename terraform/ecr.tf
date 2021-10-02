# ---------------------------------------------------------------------------------------------------------------------
# ECR
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecr_repository" "image_repo" {
  name                 = var.image_repo_name
  image_tag_mutability = "MUTABLE"

  #  image_scanning_configuration {
  #    scan_on_push = true
  #  }
}

output "image_repo_url" {
  value = aws_ecr_repository.image_repo.repository_url
}

output "image_repo_arn" {
  value = aws_ecr_repository.image_repo.arn
}
#Null resource to create and upload docker image to ECR
resource "null_resource" "create_ecr_image2" {
  depends_on = [
    aws_ecr_repository.image_repo
  ]
#
  provisioner "local-exec" {
     interpreter = ["bash", "-c"]
    command     = <<EOF

docker build ../blazorshop/. -t blazorshop
aws --region ${var.aws_region}  ecr get-login-password | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com
echo ***Uploading Image to ${aws_ecr_repository.image_repo.repository_url}***
docker tag blazorshop:latest ${aws_ecr_repository.image_repo.repository_url}:latest
docker push ${aws_ecr_repository.image_repo.repository_url}:latest
EOF
  }
}