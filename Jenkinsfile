pipeline {
  agent any
  tools {
        terraform 'terraform'
    }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('diegoaco-dockerhub')
    AWS_ACCESS_KEY_ID=credentials('diegoa-aws-cred')
    AWS_SECRET_ACCESS_KEY=credentials('diegoa-aws-cred')
  }
  stages {

  stage('Ansible installation'){
            steps{
                sh 'ansible --version'

           }
        }

    stage('Build') {
      steps {
        sh 'docker build -t diegoaco/project_flask .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push diegoaco/project_flask'
      }
    }
    stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }

         stage('Ansible') {
              steps {
                dir('ansible') {
                    ansiblePlaybook(
                        credentialsId: 'diegoKeyPair2',
                        disableHostKeyChecking: true,
                        installation: 'ansible',
                        inventory: 'hosts.inv',
                        playbook: 'test.yml'
                    )
                }
             }
        }
  } 
  post {
    always {
      sh 'docker logout'
    }
  }

  

}
