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
    stage('Create kube config file') {
      steps{
        withAWS(credentials: 'awscredentials',region: 'us-west-2') {
          sh 'aws eks update-kubeconfig --name abcapstone4'
        }
      }
    }
    stage('Deploy blue container'){
      steps {
        withKubeConfig([credentialsId: 'kubectlid']) {
          sh '/usr/local/bin/kubectl version --client'
          sh '/usr/local/bin/kubectl config --kubeconfig=/var/jenkins_home/.kube/config view'
          sh 'kubectl cluster-info dump --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl get pods --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl config use-context arn:aws:eks:us-west-2:406401063468:cluster/abcapstone4 --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl apply -f deploy.yml --kubeconfig=/var/jenkins_home/.kube/config'
          sleep(time:20,unit:"SECONDS")
        }
      }
    }
    stage('Approval'){
      steps {
        withAWS(region:'us-west-2', credentials:'awscredentials') {
          sh 'kubectl get service/capstone-project-cloud-devops-test --kubeconfig=/var/jenkins_home/.kube/config'
        }
        input "Does the new version looks good?"
      }
    }
    stage('Deploy latest on prod container'){
      steps {
        withKubeConfig([credentialsId: 'kubectlid']) {
          sh 'kubectl config use-context arn:aws:eks:us-west-2:406401063468:cluster/abcapstone4 --kubeconfig=/var/jenkins_home/.kube/config'
          sh 'kubectl apply -f deploy.yml --kubeconfig=/var/jenkins_home/.kube/config'
          sleep(time:20,unit:"SECONDS")
          sh 'kubectl get service/capstone-project-cloud-devops-prod --kubeconfig=/var/jenkins_home/.kube/config'
        }
      }
    }
  }
}
