pipeline {
  agent any 

  environment {
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
