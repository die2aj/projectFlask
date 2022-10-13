pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('diegoaco-dockerhub')
  }
  stages {
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
  } 
  post {
    always {
      sh 'docker logout'
    }
  }
}
