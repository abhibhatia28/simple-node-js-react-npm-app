pipeline {
  agent any
  environment {
    registry = "abhibhatia/reactapp-image-abcapstoneproject"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/abhibhatia28/simple-node-js-react-npm-app.git'
      }
    }
    stage('print all env') {
      steps {
        sh 'printenv | sort'
      }
    }
    stage('echo path') {
      steps {
        sh 'echo $Path'
      }
    }
    stage('Create kube config file') {
      steps{
        withAWS(region: 'us-west-2') {
          sh 'aws eks update-kubeconfig --name abcaptstone-cluster'
        }
      }
    }
  }
}
