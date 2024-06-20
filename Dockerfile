FROM ghcr.io/graalvm/native-image-community:21.0.2-ol9-20240116

# RUN microdnf install -y gzip tar && microdnf clean all

WORKDIR /app
COPY . .
RUN ./mvnw clean package

#     native-image --no-fallback --static --strict-image-heap -march=native -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-static

# musl --version
# ldd --version


# docker build -t test1 .
# docker buildx build --platform linux/amd64 -t test2 .

# docker run -it --entrypoint /bin/bash test1
# docker run -it --platform linux/amd64 --entrypoint /bin/bash test2

# docker ps -a
# docker cp [containerId]:/app/target/demo /Users/michaelkim/Desktop/demo/target