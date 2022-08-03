#FROM java:8
FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
EXPOSE 8160
ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=prod","-Xmx256M -Xms256M -Xmn128M -XX:+UseParNewGC  -XX:+UseConcMarkSweepGC"]

#ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=prod"]
