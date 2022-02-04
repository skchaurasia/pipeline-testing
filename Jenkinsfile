pipeline {
    agent {label 'linuxslave1'}
   
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage("docker build and docker push") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhubpasswd', passwordVariable: 'pass_value', usernameVariable: 'user_name')]) {
                        sh "docker build -t skcnetworknuts/apacheserver:1.0 ."
			sh "echo ${pass_value}| docker login -u ${user_name} --password-stdin"
                        sh "docker push skcnetworknuts/apacheserver:1.0"
                        sh "docker rmi skcnetworknuts/apacheserver:1.0"
                    }
            }
        }
    }
}

