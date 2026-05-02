pipeline {
    agent any

    stages {
stage('Clone Repo') {
    steps {
        checkout([
            $class: 'GitSCM',
            branches: [[name: '*/main']],
            userRemoteConfigs: [[url: 'git@github.com:gkorde01/kvm-devops-project.git']]
        ])
    }
}
        stage('Run Ansible') {
            steps {
                sh 'ansible-playbook -i ansible/inventory.ini ansible/webserver.yml'
            }
        }

        stage('Verify') {
            steps {
                sh 'curl http://192.168.122.148'
            }
        }
    }
}
