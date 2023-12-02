pipeline {
    agent any
    parameters {
  string 'Docker-Image-Name'
  string 'GIT-URL'
  choice choices: ['Python','Java','JavaScript','Go-Lang'], name: 'Project-Category'
}


    stages {
        stage('Clone Repository') {
            steps {
                script {
                    checkout([
                            $class: 'GitSCM',
                            branches: [[name: "*/main"]],
                            doGenerateSubmoduleConfigurations: false,
                            extensions: [],
                            submoduleCfg: [],
                            userRemoteConfigs: [[credentialsId: 'git',         
                                                 url: params.'GIT-URL']]
                             ])
                   }
                 }         
        }
        stage('Build Docker Image'){
            steps{
                sh "docker build -t sachithram/${Project-Category}-${Docker-Image-Name} ."
            }
        }
        stage('Run Docker Image'){
            steps{
                sh "docker run sachithram/${Project-Category}-${Docker-Image-Name}"
            }
        }
        stage('Monitoring'){
            steps{
                sh "docker stat"
            }
        }
        
    }
}
