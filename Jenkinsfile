pipeline {
    agent any
    environment {
        AWS_REGION = "us-west-2"
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh "terraform init"
            }
        }
        stage('Deploy to Dev') {
            steps {
                sh '''
                terraform workspace select dev || terraform workspace new dev
                terraform plan -var-file=envs/dev.tfvars
                terraform apply -auto-approve -var-file=envs/dev.tfvars
                '''
            }
        }
        stage('Deploy to Stage') {
            steps {
                sh '''
                terraform workspace select stage || terraform workspace new stage
                terraform plan -var-file=envs/stage.tfvars
                terraform apply -auto-approve -var-file=envs/stage.tfvars
                '''
            }
        }
        stage('Deploy to Prod') {
            steps {
                sh '''
                terraform workspace select prod || terraform workspace new prod
                terraform plan -var-file=envs/prod.tfvars
                terraform apply -auto-approve -var-file=envs/prod.tfvars
                '''
            }
        }
    }
}