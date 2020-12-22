pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    environment {
        CI = 'true'
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
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t abhibhatia28/my-first-react-app-image . < Dockerfile' 
            }
        }        
    }
}
