FROM maven:3.6.1-jdk-8 as maven_builder
ADD target/dependency/webapp-runner.jar ./
WORKDIR /app
ADD pom.xml .

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . $HOME

RUN ["mvn","clean","install -DskipTests=true"]

FROM openjdk:8u171-jre-alpine
COPY --from=maven_builder  /app/target/CICD.war ./webapp-runner.jar ./
CMD java $JAVA_OPTIONS -jar webapp-runner.jar --port $PORT CICD.war