
FROM eclipse-temurin:25-jdk

WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN chmod +x mvnw && ./mvnw -B dependency:go-offline

COPY src ./src

RUN ./mvnw -B package -DskipTests

CMD ["java", "-jar", "target/studyflow-backend-0.0.1-SNAPSHOT.jar"]
