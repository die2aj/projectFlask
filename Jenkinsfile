pipeline {
  agent any
  stages {
    stage('Build') {
            steps {
                //  Building new image
                sh 'docker image build -t project_flask .'
                sh 'docker run -p 5000:5000 -d project_flask'
                echo "Image built"
            }
        }
  
  }
  
}
