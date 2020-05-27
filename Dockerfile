FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH

RUN mkdir -p /opt/application

COPY ${JAR_FILE_PATH} /opt/application/app.jar

ENTRYPOINT ["java","-jar","/opt/application/app.jar"]
