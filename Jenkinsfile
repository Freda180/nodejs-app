pipeline {
    agent any 

     options {
        timeout(time: 10, unit: 'MINUTES')
     }
    environment {
    ACR_NAME = "fredaacr"
    registyUrl = "fredaacr.azurecr.io"
    IMAGE_NAME = "nodejswebapp"
    IMAGE_TAG = "v1.0.0"
    registryCredential  = "freda-acr"
    }
    stages { 
        stage('SCM Checkout') {
            steps{
           git branch: 'main', url: 'https://github.com/Freda180/nodejs-app.git'
            }
        }
       
       // Building Docker Image 
       stage ('Build Docker image') {
        steps {
                script {
                    //dockerImage = docker.build registryUrl
                 def dockerImage = docker.build("${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${IMAGE_TAG}", '.') 
                }
            }
       } 
    // Uploading Docker images into ACR
        stage('Upload Image to ACR') {
         steps{   
             script {
                 docker.withRegistry( "http://${ACR_NAME}.azurecr.io", registryCredential ) {
               // dockerImage.push()
              sh " docker push ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${IMAGE_TAG}"
                  }
              }
         }
      }
    }
}
