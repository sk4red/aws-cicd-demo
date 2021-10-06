This demo walks through a sequence showing how Terraform can be used to build a pipeline for an Amazon ECS Fargate workload based on the BlazorShop sample application. The pipeline uses AWS CodePipeline, AWS CodeCommit, AWS CodeBuild, Amazon ECS/Fargate and Amazon ECR.

![AWS Serverless CI/CD Pipeline Architecture](https://github.com/sk4red/aws-cicd-demo/blob/main/aws-cicd-arch.png)

### FARGATE

Before Fargate:-

- When creating an ECS Cluster we had to create EC2 instances
- If we wanted to scale, we needed to add more EC2 instances
- We manage the infrastructure

With Fargate:-

- It’s all Serverless
- We don’t need to provision EC2 instances
- We just create task definitions and AWS will run our containers for us
- To scale, just increase the number of tasks. Simple! No more EC2.

### Pre-requisites
- Run code from AWS CLI 
- Terraform
- Docker 
- Git 
- AWS account with sufficient privileges to deploy resources and credentials to use AWS Code Commit

### Build Infrastructure
I will use terraform to build the infrastructure for the demo, including:-
 
- SSM Parameter Store
- ECS Cluster
- RDS Database
- AWS CodePipeline

### Set up SSM Parameter Store
Our Terraform config files will expect to find a password for the RDS MySQL database in SSM parameter store.

We can set up an SSM parameter to store the password in the AWS console or form the AWS Cli as follows:

***aws ssm put-parameter --name /database/password  --value mysqlpassword --type SecureString***

### Set Terraform variables
Switch to the terraform folder or open up the code in VS Code.

Edit terraform.tfvars. Leave the aws_profile as “default”, and set aws_region to the correct value for your environment.

### Build
Initialise Terraform:

***terraform init***

Build the infrastructure and pipeline using terraform:

***terraform apply***

Terraform will display an action plan. When asked whether you want to proceed with the actions, enter yes.
Wait for Terraform to complete the build before proceeding. It will take few minutes to complete “terraform apply”

### Explore the Stack
Once the build is complete, we can explore our environment using the AWS console:- 

- View the RDS database using the [Amazon RDS console](https://console.aws.amazon.com/rds)
- View the ALB using the [Amazon EC2 console](https://console.aws.amazon.com/ec2)
- View the ECS cluster using the [Amazon ECS console](https://console.aws.amazon.com/ecs)
- View the ECR repo using the [Amazon ECR console](https://console.aws.amazon.com/ecr)
- View the CodeCommit repo using the [AWS CodeCommit console](https://console.aws.amazon.com/codecommit)
- View the CodeBuild project using the [AWS CodeBuild console](https://console.aws.amazon.com/codebuilld)
- View the pipeline using the [AWS CodePipeline console](https://console.aws.amazon.com/codepipeline)





