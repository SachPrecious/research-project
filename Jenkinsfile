pipeline {
    agent any
    parameters {
    string 'Docker-Image-Name'
    string 'GIT-URL'
    choice choices: ['Python','Java','JavaScript','Go-Lang'], name: 'Project-Category'
}


    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
