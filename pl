pipeline {
    agent any

    environment {
        // Path to Node.js (adjust if installed elsewhere)
        PATH = "C:\\Program Files\\nodejs;${env.PATH}"

        // Directory where the production build will be deployed
        DEPLOY_DIR = "C:\\deploy\\fromvalidator"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo " Checking out code from GitHub repository..."
                git branch: 'main',
                    url: 'https://github.com/CharuKanniga/from-validator.git' 
// ur repositor link
            }
        }

        stage('Check Node & NPM Versions') {
            steps {
                echo " Checking Node.js and npm versions..."
                bat 'node -v'
                bat 'npm -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo " Installing npm dependencies..."
                bat 'npm install'
            }
        }

        stage('Build React App (Vite)') {
            steps {
                echo "⚙ Building Vite React app..."
                bat 'npm run build'
            }
        }

        stage('Deploy Build Artifacts') {
            steps {
                echo " Deploying built files to deployment directory..."
                bat 'if not exist "%DEPLOY_DIR%" mkdir "%DEPLOY_DIR%"'
                // Vite outputs to 'dist', not 'build'
                bat 'xcopy dist "%DEPLOY_DIR%" /E /I /Y'
            }
        }
    }

    post {
        success {
            echo ' SUCCESS: Vite React app built and deployed successfully from "fromvalidator" pipeline!'
        }
        failure {
            echo ' ERROR: Build failed. Check Jenkins logs for detailed error output.'
        }
    }
}
