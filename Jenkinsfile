pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/SuperBoomba/FinalProjectJenk.git'
            }
        }
        
        stage('Run PowerShell Script') {
            steps {
                powershell '''
                    # סקריפט PowerShell שלך כאן
                    echo "<html><head><title>Welcome Page</title></head><body><h1>Hello, Guest!</h1><p>Welcome to the Jenkins-generated HTML page.</p></body></html>" > output.html
                '''
            }
        }

        stage('List Files') {
            steps {
                powershell 'dir'  // מציג את רשימת הקבצים בתיקייה
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportName: 'HTML Report',
                    reportDir: '.',
                    reportFiles: 'output.html'
                ])
            }
        }
    }
}
