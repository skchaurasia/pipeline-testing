pipeline {
    agent {label 'linuxslave1'}
   
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage("pull github repository") {
            steps {
                sh 'git clone https://github.com/skchaurasia/nodejs-testapp.git'
            }
        }
        stage("docker build and docker push") {
            steps {
                withCredentials([usernameColonPassword(credentialsId: 'dockerhubpasswd', variable: 'dockerhub')]) {
                        sh "docker build -t skcnetworknuts/nodejstestrepo:2.2 nodejs-testapp/"
                        sh "docker login -u skcnetworknuts -p ${dockerhub} docker.io"
                        sh "docker push skcnetworknuts/nodejstestrepo:2.2"
                        sh "docker rmi skcnetworknuts/nodejstestrepo:2.2"
                    }
            }
        }
    
    }
}

