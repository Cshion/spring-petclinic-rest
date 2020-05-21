node {
    
    stage("Preparation"){
        checkout scm
    }

    stage("Build"){
        steps.sh "mvn test-compile"
    }

    stage("Unit Test"){
        try{
            steps.sh "mvn test"
        }catch(e){
            throw e
        }finally{
            junit 'target/surefire-reports/TEST-*.xml'
            jacoco()
        }
    }
    
}
