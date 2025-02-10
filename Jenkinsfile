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
}
