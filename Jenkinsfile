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
    stage('Test #2') {
      steps {
        sh '''# send display to Xvfb (X Windows video frame buffer - lightweight X Windows)
export DISPLAY=:0
# mkdir -p results
# pybot -d results Sample1/testsuites/
# pabot --processes 6 --outputdir results Sample1/testsuites/*.robot
chmod +x ./Sample1/scripts/launch_test_and_rerun.sh 
./Sample1/scripts/launch_test_and_rerun.sh ./Sample1/testsuites/
echo "exit status was: " $? # echo exit status'''
      }
    }
    stage('Deploy') {
      steps {
        build 'SampleDeployJob'
      }
    }
  }
}