pipeline {
    agent any

    options {
        timeout(time: 10, unit: 'MINUTES')
    }

    environment {
        TARGET_IP = "192.168.122.148"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/gkorde01/kvm-devops-project.git'
            }
        }

        stage('Run Ansible (Full Setup)') {
            steps {
               sh '''
               cd ansible
               ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini site.yml -vvv
               '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                curl -f http://$TARGET_IP
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
