pipeline {
    agent any
    parameters {
        string(name: 'UserName', defaultValue: 'Guest', description: 'Enter the user name')
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/SuperBoomba/FinalProjectJenk.git', branch: 'main'
            }
        }
        stage('Run PowerShell Script') {
            steps {
                powershell script: """
                    .\\YourScript.ps1 -UserName ${params.UserName}
                """
            }
        }
        stage('Show HTML Output') {
            steps {
                powershell script: """
                    Get-Content output.html | Out-String
                """
            }
        }

    }
    stage('Publish HTML Report') {
    steps {
        publishHTML(target: [
            reportDir: '.', // התיקייה שבה ה-HTML נמצא
            reportFiles: 'output.html', // שם קובץ ה-HTML
            reportName: 'Generated HTML Report', // שם הכפתור שיופיע ב-Jenkins
            keepAll: true, // שמירת דוחות מכל הבניות
            alwaysLinkToLastBuild: true // תמיד להציג את הדוח האחרון
        ])
    }
}
}
