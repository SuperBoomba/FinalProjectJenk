pipeline {
    agent any
    parameters {
        string(name: 'UserName', defaultValue: 'Alon', description: 'Enter the username')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[url: 'https://github.com/SuperBoomba/FinalProjectJenk.git']]])
            }
        }

        stage('Build') {
            steps {
                script {
                    def user = params.UserName
                    echo "Building the project for user: ${user}"
                    powershell "powershell.exe -ExecutionPolicy Bypass -File YourScript.ps1 -UserName '${user}'"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                powershell '''
                    Move-Item -Path output.html -Destination C:\\inetpub\\wwwroot\\index.html -Force
                '''
            }
        }
    }
    
    post {
        success {
            echo 'The pipeline has finished successfully!'
            publishHTML(target: [
                reportName: 'My HTML Report',
                reportDir: 'C:\\inetpub\\wwwroot',  // נתיב לתיקיית הדוח
                reportFiles: 'index.html',         // שם קובץ ה-HTML
                alwaysLinkToLastBuild: true,
                keepAll: true
            ])
        }
        failure {
            echo 'The pipeline has failed.'
        }
    }
    
    stage('Send Notification') {
        steps {
            bat 'powershell -Command "msg * ג׳נקינס: המשימה הסתיימה בהצלחה!"'
        }
    }
}
