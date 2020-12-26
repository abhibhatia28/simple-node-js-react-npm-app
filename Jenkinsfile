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
          sh 'aws eks update-kubeconfig --name abcapstone-cluster'
        }
      }
    }
    stage('Deploy blue container'){
      steps {
        withKubeConfig([credentialsId: 'kubectlid']) {
          sh 'cat /var/jenkins_home/.kube/config'
          sh '/usr/local/bin/kubectl version --client --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl apply -f bluedeploy.yml'
          sleep(time:20,unit:"SECONDS")
          sh 'kubectl apply -f blueservice.json'
        }
      }
    }
  }
}
