pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    environment {
        CI = 'true'
        registry = "abhibhatia/my-first-react-app-image"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Install dependencies') { 
            steps {
                sh 'npm install' 
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build' 
            }
        }
        stage('Test') { 
            steps {
                sh './jenkins/scripts/test.sh' 
            }
        }
        stage('Lint') { 
            steps {
                sh 'npm run lint' 
            }
        }
        stage('Building image') {
            steps {
              script {
                dockerImage = docker.build -t registry
              }
            }       
        }
    }
}
