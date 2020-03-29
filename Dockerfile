FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /app
ADD pom.xml .

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . $HOME

RUN ["mvn","clean","install"]

FROM tomcat:9.0-jre8-alpine

RUN ["rm", "-fr", "/usr/local/tomcat/webapps"]
COPY --from=maven_builder /app/target/CICD.war ./target/

FROM openjdk:8u171-jre-alpine
WORKDIR /app
COPY ./target/CICD.war ./target/dependency/webapp-runner.jar ./
CMD java $JAVA_OPTIONS -jar webapp-runner.jar --port $PORT CICD.war