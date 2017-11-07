pipeline {
  agent {
    node {
      label 'master'
    }
    
  }
  stages {
    stage('Build') {
      steps {
        build 'SampleBuildJob'
      }
    }
    stage('Test') {
      steps {
        build 'RobotFramework_Sample_3_Project'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo "Deployment was successful"'
      }
    }
  }
}