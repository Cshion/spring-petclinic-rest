node {

    stage("Preparation"){
        checkout scm
    }

    stage("Build"){
        sh "mvn -B -DskipTests clean package"
    }

    stage("Unit Testing"){
        try{
            //sh "mvn test"
        }catch(e){
            throw e
        }finally{
            //junit 'target/surefire-reports/TEST-*.xml'
            //jacoco()
        }
    }   

    stage("Archive Artifacts"){
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
    }

    stage("Deploy"){
        def appName    = sh(script: "mvn -q -N org.codehaus.mojo:exec-maven-plugin:1.3.1:exec -Dexec.executable='echo' -Dexec.args='\${project.artifactId}'", returnStdout: true).trim()
        def appVersion = sh(script: "mvn -q -N org.codehaus.mojo:exec-maven-plugin:1.3.1:exec -Dexec.executable='echo' -Dexec.args='\${project.version}'", returnStdout: true).trim()
        def jarPath    = "target/${appName}-${appVersion}.jar"
        
        echo "${jarPath}"
        sh "docker build --no-cache --build-arg JAR_FILE_PATH=${jarPath} -t demo/${appName}:${appVersion} ."

        //Simulacion de despliegue
        sh "docker stop ${appName}-${appVersion} &> /dev/null"
        sh "docker run --name ${appName}-${appVersion} -d -p 9966:9966 demo/${appName}:${appVersion}"
    }
    
}
