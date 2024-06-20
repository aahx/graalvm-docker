FROM ghcr.io/graalvm/native-image-community:21.0.2-ol9-20240116
WORKDIR /app
COPY . .
RUN ./mvnw clean package


# docker build -t test2 .
# docker run -it --entrypoint /bin/bash test2

# uname -m
# musl --version
# native-image --version
# ldd --version
# rpm -q zlib
# gzip --version
# tar --version

# ls -l target

# native-image -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-dynamic
# native-image --report-unsupported-elements-at-runtime --no-fallback --static -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-static


# docker ps -a
# docker cp [containerId]:/app/target/demo /Users/michaelkim/Desktop/demo/target
