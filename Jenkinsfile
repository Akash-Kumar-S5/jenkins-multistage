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
                sh 'terraform init'
            }
        }
        stage('Deploy to Dev') {
            steps {
                sh "terraform plan -var-file=envs/dev.tfvars"
                sh "terraform destroy -auto-approve -var-file=envs/dev.tfvars"
            }
        }
        stage('Deploy to Stage') {
            steps {
                sh "terraform plan -var-file=envs/stage.tfvars"
                sh "terraform destroy -auto-approve -var-file=envs/stage.tfvars"
            }
        }
        stage('Deploy to Prod') {
            steps {
                sh "terraform plan -var-file=envs/prod.tfvars"
                sh "terraform destroy -auto-approve -var-file=envs/prod.tfvars"
            }
        }
    }
}