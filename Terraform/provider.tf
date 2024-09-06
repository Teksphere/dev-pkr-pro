terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}
module "ec2_or_asg" {
  source           = "./modules/ec2_asg"  # Adjust this path to where your module is located
  ami_id           = "ami-0e86e20dae9224db8"       # Replace with a valid AMI ID for your region
  instance_type    = "t2.medium"
  key_name         = "uni-key"      # Replace with your actual key pair name
  use_asg          = true                 # Set to false for standalone EC2
  min_size         = 1
  max_size         = 3
  desired_capacity = 2
}