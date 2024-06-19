FROM alexjarvisrws/graalvm-native-image-builder:0.0.2

# RUN microdnf install -y gzip tar && microdnf clean all

ENV JAR_FILE=/app/target/demo-0.0.1-SNAPSHOT.jar
ENV OUTPUT_NAME=pkv-data-service

WORKDIR /app
COPY . .

RUN ./mvnw clean package

#RUN native-image --no-fallback -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
