pipeline {
  agent any
  environment {
    registry = "abhibhatia/hubreactapp1"
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
        sh 'npm install'
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
        sh 'npm run build'
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
        sh 'npm run lint' 
      }
    } 
  }
}
