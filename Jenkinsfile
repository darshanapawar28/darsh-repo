pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
    }

    stages {
        stage("Checkout Code") {
            steps {
                git branch: 'main', url: 'https://github.com/darshanapawar28/darsh-repo.git'
            }
        }
        
        stage("TF Init") {
            steps {
                sh "terraform init"
            }
        }

        stage("TF Validate") {
            steps {
                sh "terraform validate"
            }
        }

        stage("TF Plan") {
            steps {
                sh "terraform plan"
            }
        }

        stage("TF Apply") {
            steps {
                sh "terraform apply -auto-approve"
            }
        }

        stage("Invoke Lambda") {
            steps {
                sh "aws lambda invoke --function-name my_lambda_function --log-type Tail output.log"
            }
        }
    }
}
