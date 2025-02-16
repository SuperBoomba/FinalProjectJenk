pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                powershell '''
                    $htmlContent = "<html><body>Welcome to Jenkins!</body></html>"
                    Set-Content -Path output.html -Value $htmlContent
                '''
            }
        }
    }
}
