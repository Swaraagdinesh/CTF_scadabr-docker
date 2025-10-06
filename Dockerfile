# Use a valid Maven image with OpenJDK 17
FROM maven:3.8.8-jdk-17

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

RUN apt-get update && apt-get install -y tomcat9 && apt-get clean

RUN rm -rf /var/lib/tomcat9/webapps/* && cp target/ScadaBR.war /var/lib/tomcat9/webapps/ROOT.war

EXPOSE 8081

CMD ["catalina.sh", "run"]
