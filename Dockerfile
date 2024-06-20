FROM ghcr.io/graalvm/native-image-community:21.0.2-ol9-20240116
#RUN microdnf install -y gzip tar && microdnf clean all
WORKDIR /app
COPY . .
RUN ./mvnw clean package


# docker build -t test11 .
# docker run -it --entrypoint /bin/bash test11

# uname -m
# musl --version
# ldd --version
# native-image --version
# ls -l target

# native-image --help

# native-image -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-dynamic
# native-image --static -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-static

# docker ps -a
# docker cp [containerId]:/app/target/demo /Users/michaelkim/Desktop/demo/target