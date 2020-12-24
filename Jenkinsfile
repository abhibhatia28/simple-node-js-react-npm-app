pipeline {
  agent any
  environment {
    registry = "abhibhatia/my-first-react-image"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  stages {
    stage('Kubernetes cluster') {
            steps {
                withAWS(region:'us-west-2', credentials:'aws-kubernetes') {
                    sh '
                    '''
                }
            }
    }
  }
}

