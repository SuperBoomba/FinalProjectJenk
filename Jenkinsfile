pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[url: 'https://github.com/SuperBoomba/FinalProjectJenk.git']]
                ])
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the project...'
                powershell '''
                    $htmlContent = "<html><body>Welcome to Jenkins!</body></html>"
                    # בצע את שאר הפעולות שלך עם המשתנה
                    $htmlContent
                '''
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
            // פרסום דוח ה-HTML
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
