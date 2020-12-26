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
          sh 'cat /usr/local/bin/.kube/config'
          sh '/usr/local/bin/kubectl.exe config view'
          sh 'kubectl config use-context arn:aws:eks:abhibhatia@abcapstone-cluster.us-west-2/reactapp-image-abcapstoneproject'
          sh 'kubectl apply -f bluedeploy.yml'
          sleep(time:20,unit:"SECONDS")
          sh 'kubectl apply -f blueservice.json'
        }
      }
    }
  }
}
