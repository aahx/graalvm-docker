FROM ghcr.io/graalvm/native-image-community:21.0.2-ol9-20240116
RUN microdnf install -y gzip tar && microdnf clean all
WORKDIR /app
COPY . .
RUN ./mvnw clean package

# docker build -t test10 .
# docker run -it --entrypoint /bin/bash test10
# native-image -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-dynamic-aarch
# native-image --static -march=compatibility -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-compatibility

# native-image --static -march=native -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-native

## BUILDS IN ARM


# uname -m
# musl --version
# ldd --version
# ls -l target
# native-image --version



# docker build -t test1 .
# docker buildx build --platform linux/amd64 -t test2 .

# docker run -it --entrypoint /bin/bash test1
# docker run -it --platform linux/amd64 --entrypoint /bin/bash test2

# docker ps -a
# docker cp [containerId]:/app/target/demo /Users/michaelkim/Desktop/demo/target