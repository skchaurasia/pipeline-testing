pipeline {
    agent {label 'linuxslave1'}
    parameters{
	choice(name: 'State', choices: "Start\nStop", description: 'Select the State')
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage("docker build and docker push") {
	  when {
		expression { State == 'Start' }
	  }
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

