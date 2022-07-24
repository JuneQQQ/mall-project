#FROM java:8
FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
EXPOSE 16005
ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=prod","-Xmx512M -Xms512M -Xmn128M -XX:+UseParNewGC  -XX:+UseConcMarkSweepGC"]