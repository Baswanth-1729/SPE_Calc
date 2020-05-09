FROM maven:3.6.3-jdk-8 as builder
WORKDIR /build
COPY pom.xml .

COPY src/ /build/src/
RUN mvn install

# Step : Package image
FROM openjdk:8-jre

COPY --from=builder /build/target/calculator-1.0-SNAPSHOT.jar .
#CMD java -cp ./target/calculator-1.0-SNAPSHOT.jar:./target/classes/  calculator.Calculator
#CMD java -cp ./target/calculator-1.0-SNAPSHOT.jar:. calculator.Calculator

CMD java -cp calculator-1.0-SNAPSHOT.jar:/build/target/classes/ com.calculator.Calculator
#CMD java -version
