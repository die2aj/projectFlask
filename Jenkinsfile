pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub')
  }
  stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/die2aj/projectFlask.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t diegoa/projecta:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push diegoa/projectflask:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}
  
}
