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
    stage('Create kube config file') {
      steps{
        withAWS(credentials: 'awscredentials',region: 'us-west-2') {
          sh 'aws eks update-kubeconfig --name abcaptstone-cluster'
        }
      }
    }
  }
}
