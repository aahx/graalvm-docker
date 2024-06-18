FROM ghcr.io/graalvm/native-image-community:22

WORKDIR /app
COPY . .

RUN ./mvnw clean package

RUN native-image --no-fallback -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
