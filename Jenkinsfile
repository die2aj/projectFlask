

pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('diegoaco-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t diegoaco/projectflask:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push diegoaco/projectflask:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}