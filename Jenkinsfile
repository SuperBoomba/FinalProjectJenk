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
                    userRemoteConfigs: [[url: 'https://github.com/SuperBoomba/FinalProjectJenk.git']])
            }
        }

        stage('Run PowerShell Script') {
            steps {
                script {
                    def user = params.UserName
                    powershell """
                    param (
                        [string]$UserName
                    )

                    \$htmlContent = @"
                    <html>
                    <head>
                        <title>Welcome Page</title>
                    </head>
                    <body>
                        <h1>Hello, \$UserName!</h1>
                        <p>Welcome to the Jenkins-generated HTML page.</p>
                    </body>
                    </html>
                    "@

                    \$outputPath = "output.html"
                    \$htmlContent | Out-File -FilePath \$outputPath -Encoding UTF8
                    Write-Output "HTML file has been generated at \$outputPath"
                    """
                }
            }
        }
    }
}
