node {

    stage("Preparation"){
        checkout scm
    }

    stage("Build"){
        sh "mvn compile test-compile"
    }

    stage("Unit Testing"){
        try{
            sh "mvn test"
        }catch(e){
            throw e
        }finally{
            junit 'target/surefire-reports/TEST-*.xml'
            jacoco()
        }
    }   

    stage("Archive Artifacts"){
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
    }

    stage("Deploy"){

    }
    
}
