pipeline {
  agent any
  environment {
    registry = "abhibhatia/reactapp-image-abcapstoneproject"
    registryCredential = 'dockerhub'
    dockerImage = ''
    Path = "$PATH;C:\Program Files\Amazon\AWSCLIV2\;"
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/abhibhatia28/simple-node-js-react-npm-app.git'
      }
    }
    stage('echo path') {
      steps {
        sh 'printenv | sort'
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
