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

        stage('Run PowerShell Script') {
            steps {
                script {
                    // הגדרת המשתנה ב-Groovy
                    def user = params.UserName
                    // שימוש במשתנה בצורה נכונה
                    powershell "powershell.exe -ExecutionPolicy Bypass -File scripts/YourScript.ps1 -UserName '${user}'"
                }
            }
        }
    }
}
