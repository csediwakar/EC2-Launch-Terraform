#!groovy
def applicationName ="AWS Infrastructure"
def organization ="Open Source"

pipeline {
    agent none
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
    }


    stages{
        stage("Pipeline Prepare" ){
            agent {label "master"}
            steps{
                checkout scm
                echo "Pipeline has been prepapred"

            }
        }

        stage("Create the Infra"){
            agent{label "master"}
            steps{
                script{
                    echo "Inside the infra creation step"
                    sh "terraform workspace new staging"
                    sh "terraform workspace select staging"
                    sh "terraform init"
                    sh "terraform plan "
                    def tfParameters = "-var git_commit=${env.commit} -var git_url=${env.GIT_URL}"
                    sh "terraform apply"


                }
            }
        }


    }


}