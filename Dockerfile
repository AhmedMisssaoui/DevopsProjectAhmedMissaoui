FROM openjdk:17-jdk
COPY target/DevOps_Project-2.1.jar DevOps_Project-2.1.jar
EXPOSE 8088
ENTRYPOINT ["java","-jar","/DevOps_Project-2.1.jar"]