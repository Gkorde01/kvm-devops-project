pipeline {
    agent any

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
                ansible-playbook -i inventory.ini site.yml
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                curl -s http://192.168.122.148 || true
                '''
            }
        }
    }
}
