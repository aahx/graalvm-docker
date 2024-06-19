FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol8-20240416

RUN microdnf install -y gzip tar && microdnf clean all

WORKDIR /app
COPY . .

RUN ./mvnw clean package

RUN native-image --no-fallback -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
