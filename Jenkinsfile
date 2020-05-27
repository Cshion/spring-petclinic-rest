node {
    
    stage("Preparation"){
        checkout scm
    }

    stage("Build"){
        steps.sh "mvn test-compile"
    }

    stage("Unit Testing"){
        try{
            steps.sh "mvn test"
        }catch(e){
            throw e
        }finally{
            junit 'target/surefire-reports/TEST-*.xml'
            jacoco()
        }
    }   

    stage("Static Analysis"){
        //Sonarqube
    }

    stage("Static Security Testing"){
        //Fortify
    }   

    stage("Software Composition Analysis"){
        //Snyk
    }

    stage("Deploy to Staging "){

    }

    stage("Integration Tests"){

    }

    stage("Load Tests"){
        
    }

    stage("Deploy to Production?"){

    }

    stage("Deploy to Production"){

    }
    
}
