pipeline {
  agent any
  environment {
    registry = "abhibhatia/my-first-react-image"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  stages {
    stage('Create eksctl cluster') {
      steps{
        sh 'eksctl create cluster --name prod --version 1.17 --region us-west-2 --nodegroup-name linux-nodes --node-type t2.small --nodes 3 --nodes-min 1 --nodes-max 4 --ssh-access --ssh-public-key pipeline --managed'
      }
    }
  }
}

