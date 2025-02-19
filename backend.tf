terraform {
    backend "s3" {
      bucket = "ak-123-tfstate"
      key = "jenkins-ms/terraform.tfstate"
      region = "us-west-2"
      dynamodb_table = "ak-tfapp-state"
    }
}