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
    stage('Install Dependencies') {
      agent {
        docker {
        image 'node:6-alpine' 
        args '-p 3000:3000' 
        }
      }
      steps {
        sh 'sudo npm install'
      }
    } 
    stage('Build') {
      agent {
        docker {
        image 'node:6-alpine' 
        args '-p 3000:3000' 
        }
      }
      steps {
        sh 'sudo npm run build'
      }
    } 
    stage('lint') {
      agent {
        docker {
        image 'node:6-alpine' 
        args '-p 3000:3000' 
        }
      }
      steps {
        sh 'sudo npm run lint' 
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
          sh 'aws eks update-kubeconfig --name jenkinstest'
        }
      }
    }
  }
}
