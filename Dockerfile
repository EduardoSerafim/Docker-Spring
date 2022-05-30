FROM maven:3.5.2-jdk-8-alpine AS build 
WORKDIR /temp/
COPY . .
FROM openjdk:8-jre-alpine
COPY --from=build /temp/target/demo.docker-0.0.1-SNAPSHOT.jar $CATALINA_HOME/webapps/demo.docker-0.0.1-SNAPSHOT.jar
WORKDIR $CATALINA_HOME/webapps/
ENTRYPOINT ["java", "-jar", "demo.docker-0.0.1-SNAPSHOT.jar"]