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
                    sh '''

                            eksctl create cluster \
                            --name abcluster \
                            --version 1.13 \
                            --nodegroup-name standard-workers \
                            --node-type t2.small \
                            --nodes 2 \
                            --nodes-min 1 \
                            --nodes-max 3 \
                            --node-ami auto \
                            --region us-west-2 \
                            --zones us-west-2a \
                            --zones us-west-2b \
                            --zones us-west-2c \

                    '''
                }
            }
        }

        stage('Configuration file cluster') {
            steps {
                withAWS(region:'us-west-2', credentials:'aws-kubernetes') {
                    sh '''
                        aws eks --region us-west-2 update-kubeconfig --name abcluster
                    '''
                }
            }
        }
  }
}

