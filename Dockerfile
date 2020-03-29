FROM openjdk:8u171-jre-alpine
WORKDIR /app
COPY ./target/CICD.war ./target/dependency/webapp-runner.jar ./
CMD java $JAVA_OPTIONS -jar webapp-runner.jar --port $PORT CICD.war
