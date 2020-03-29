FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /app
ADD pom.xml .

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . $HOME

RUN ["mvn","clean","install"]

COPY CICD.war webapp-runner.jar ./
CMD java $JAVA_OPTIONS -jar webapp-runner.jar --port $PORT CICD.war
