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
    stage('Deploy blue container'){
        withKubeConfig([credentialsId: 'kubectlid']) {
          sh 'cat /var/jenkins_home/.kube/config'
          sh '/usr/local/bin/kubectl version --client --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl config use-context arn:aws:eks:us-west-2:406401063468:cluster/abcaptstone-cluster'
          sh 'kubectl apply -f bluedeploy.yml'
          sleep(time:20,unit:"SECONDS")
          sh 'kubectl apply -f blueservice.json'
        }
      }
    }
  }
}
