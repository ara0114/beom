FROM openjdk:11

EXPOSE 8000

ADD build/libs/beom-0.0.1.war beom-0.0.1.war

ENTRYPOINT ["java","-jar","beom-0.0.1.war"]