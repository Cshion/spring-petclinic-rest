node {
    try{
        stage("Preparation"){
            checkout scm
        }

        stage("Build"){
            steps.sh "mvn test-compile"
        }

        stage("Unit Test"){
            steps.sh "mvn test"
        }
    }catch(e){
        throw;
    }finally{
        junit 'target/surefire-reports/TEST-*.xml'
    }
}
