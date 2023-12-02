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
  stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t sachithram/${params.Project-Category}-${params.Docker-Image-Name} ."
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    sh "docker run sachithram/${params.Project-Category}-${params.Docker-Image-Name}"
                }
            }
        }
        stage('Monitoring'){
            steps{
                sh "docker stat"
            }
        }
        
    }
}
