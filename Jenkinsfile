pipeline {
  agent any 

  environment {
    DOCKER_USER = 'totalbot123'
    PASS = credentials('docker-hub-pass') 
  }

  stages {
    stage('Build') { 
      steps {
        sh './build/buildImage.sh'
      }
    }
    stage('Test') { 
      steps {
        sh './test/test.sh'
      }
    }
    stage('Push') { 
      steps {
        sh './push/push.sh'
      }
    }
    stage('Deploy') { 
      steps {
        sh './deploy/deploy.sh'
      }
    }
  } 
}
