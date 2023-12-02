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
                            userRemoteConfigs: [[credentialsId: 'github',         
                                                 url: "params.GIT-URL"]]
                             ])
                   }
                 }         
        }
    }
}
