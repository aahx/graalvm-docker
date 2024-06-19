# WORKS BUILD with no static flag
#FROM ghcr.io/graalvm/native-image-community:22              # Works - dynmically linked


# MusLib doesn't work
#FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol9-20240416 # LATEST
#FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol8-20240416 # Oracle Linux 8
#FROM ghcr.io/graalvm/native-image-community:22-muslib-ol8              # " - OL8
#FROM ghcr.io/graalvm/native-image-community:21-muslib                  # Java 21
#FROM ghcr.io/graalvm/native-image-community:17-muslib                  # Java 17


# According to Docs https://www.graalvm.org/latest/docs/getting-started/container-images/
# FROM ghcr.io/graalvm/native-image-community:22-muslib


# Nope- none of these muslib seems to work
# A fatal error has been detected by the Java Runtime Environment:
  ##
  ##  SIGSEGV (0xb) at pc=0x00007ffffecfacd4, pid=90, tid=92
  ##
  ## JRE version: OpenJDK Runtime Environment GraalVM CE 22.0.1+8.1 (22.0.1+8) (build 22.0.1+8-jvmci-b01)
  ## Java VM: OpenJDK 64-Bit Server VM GraalVM CE 22.0.1+8.1 (22.0.1+8-jvmci-b01, mixed mode, tiered, jvmci, jvmci compiler, compressed oops, compressed class ptrs, parallel gc, linux-amd64)
  ## Problematic frame:
  ## V  [libjvm.so+0xc28cd4][thread 112 also had an error]




## WORKS
FROM ghcr.io/graalvm/native-image-community:22
RUN microdnf install -y gzip tar && microdnf clean all
WORKDIR /app
COPY . .
RUN ./mvnw clean package


#ARG RESULT_LIB="/musl"
#
#RUN #mkdir ${RESULT_LIB} && \

#    curl -L -o musl.tar.gz https://more.musl.cc/10.2.1/x86_64-linux-musl/x86_64-linux-musl-native.tgz && \
#    tar -xvzf musl.tar.gz -C /musl --strip-components 1 && \


#    cp /usr/lib/gcc/x86_64-redhat-linux/8/libstdc++.a ${RESULT_LIB}/lib/
#
#ENV CC=/musl/bin/gcc
#
#RUN curl -L -o zlib.tar.gz https://zlib.net/zlib-1.2.11.tar.gz && \
#    mkdir zlib && tar -xvzf zlib.tar.gz -C zlib --strip-components 1 && \
#    cd zlib && ./configure --static --prefix=/musl && \
#    make && make install && \
#    cd / && rm -rf /zlib && rm -f /zlib.tar.gz
#
#ENV PATH="$PATH:/musl/bin"


#COPY . .
#RUN ./mvnw clean package
#
#RUN native-image --no-fallback -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
## ---
#  ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1,
#  BuildID[sha1]=edc17918d8284b5c36679852cfd71f02236e8aba, for GNU/Linux 3.7.0, not stripped
## --


#FROM alexjarvisrws/graalvm-native-image-builder:0.0.2
#
#WORKDIR /app
#COPY . .
#
#ENV JAR_FILE=/app/target/demo-0.0.1-SNAPSHOT.jar
#ENV OUTPUT_NAME=demo
#
#RUN ./mvnw clean package




## ----- Attempting to not use muslib package but microdnf the c library ---
#FROM ghcr.io/graalvm/native-image-community:22.0.1-ol9-20240416
#
#RUN microdnf install -y glibc-static-2.34-83.0.2.el9_3.7 glibc-devel-2.34-83.0.2.el9_3.7 gzip tar gcc zlib-devel && \
#    microdnf clean all
#
#WORKDIR /app
#COPY . .
#RUN ./mvnw clean package
#
#RUN native-image --no-fallback --verbose --static --libc=musl -H:-CheckToolchain -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
## ---------


## -- Attempting Muslib
#FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol9-20240416
#FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol8-20240416 # Oracle Linux 8
#FROM ghcr.io/graalvm/native-image-community:22-muslib-ol8              # " - OL8
#FROM ghcr.io/graalvm/native-image-community:21-muslib                  # Java 21
#FROM ghcr.io/graalvm/native-image-community:17-muslib                  # Java 17
#
#RUN microdnf install -y gzip tar && microdnf clean all
#
#WORKDIR /app
#COPY . .
#RUN ./mvnw clean package
#s
#RUN native-image --no-fallback --verbose -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
# native-image -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
## ---------