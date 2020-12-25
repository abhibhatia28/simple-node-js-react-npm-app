pipeline {
  agent any
  environment {
    registry = "abhibhatia/reactapp-image-abcapstoneproject"
    registryCredential = 'dockerhub'
    dockerImage = ''
    HOME = "."
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/abhibhatia28/simple-node-js-react-npm-app.git'
      }
    }
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    } 
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    } 
    stage('lint') {
      steps {
        sh 'npm run lint' 
      }
    } 
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
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
