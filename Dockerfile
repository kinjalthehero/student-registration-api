FROM maven:3.9-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -q

FROM tomcat:9-jdk8-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/studentregistration.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE ${PORT:-8080}
CMD sed -i "s/8080/${PORT:-8080}/g" /usr/local/tomcat/conf/server.xml && catalina.sh run
