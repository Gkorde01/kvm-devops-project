pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/gkorde01/kvm-devops-project.git'
                    ]]
                ])
            }
        }

        stage('Run Ansible') {
            steps {
                sh '''
                cd ansible
                ansible-playbook -i inventory.ini webserver.yml
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'curl -s http://192.168.122.148 || true'
            }
        }
    }
}
