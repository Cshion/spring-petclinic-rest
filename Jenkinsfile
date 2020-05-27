@Library("devopsSharedLibrary")

def devopsSharedLibrary = new DevopSharedLibrary()

node {
    stage("Preparation"){
        checkout scm
    }

    stage("Build"){
        devopsSharedLibrary.build()
    }

    stage("Unit Testing"){
        devopsSharedLibrary.unitTest();
    }   

    stage("Archive Artifacts"){
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
    }

    stage("Deploy"){
        devopsSharedLibrary.deployApplication();
    }
    
}
