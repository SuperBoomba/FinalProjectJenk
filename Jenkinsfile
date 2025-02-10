pipeline {
    agent any
    
    // הגדרת הסטייג'ים של הפייפליין
    stages {
        stage('Checkout') {
            steps {
                // שלב של קבלת הקוד מ-GitHub
                git branch: 'main', url: 'https://github.com/SuperBoomba/FinalProjectJenk.git'
            }
        }
        
        stage('Build') {
            steps {
                // כאן תוכל להוסיף את הפקודות לבניית הפרויקט שלך
                echo 'Building the project...'
                // לדוגמה, אם מדובר בפרויקט Java:
                // sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                // כאן תוכל להוסיף את הפקודות להרצת הבדיקות שלך
                echo 'Running tests...'
                // לדוגמה:
                // sh 'mvn test'
            }
        }
        
        stage('Deploy') {
            steps {
                // כאן תוכל להוסיף את הפקודות לפריסת הפרויקט
                echo 'Deploying the project...'
                // לדוגמה:
                // sh './deploy.sh'
            }
        }
    }
    
    // ניתן להוסיף כאן post-actions אם יש צורך, למשל שליחת מיילים או הודעות.
    post {
        success {
            echo 'The pipeline has finished successfully!'
        }
        failure {
            echo 'The pipeline has failed.'
        }
    }
}
