pipeline {
    agent any
    stages {
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
                script {
                    def lambda_output = sh(script: "aws lambda invoke --function-name send-notification --log-type Tail output.json", returnStdout: true).trim()
                    echo "Lambda Response: ${lambda_output}"
                }
            }
        }
    }
}



