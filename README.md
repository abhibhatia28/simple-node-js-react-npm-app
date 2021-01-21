The repository contains a simple Node.js and React application which generates
a web page with the content "Welcome to nginx" and is accompanied by a test to
check that the application renders satisfactorily.

I am using Jenkins to Install dependencies, build, lint and finally create a docker image

I am using a eks blue/green deployment deployment time

I built my own Kubernetes cluster using eksctl create cluster command

I further enhanced the Jenkins pipeline to deploy image in the newly created cluster and wait for user confirmation to validate if deployment is looking good in Blue before it is moved to Green.
