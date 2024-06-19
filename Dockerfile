# WORKS BUILD with no static flag
#FROM ghcr.io/graalvm/native-image-community:22              # Works - dynmically linked

# MusLib doesn't work

#FROM ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol9-20240416 # LATEST
#FROM ghcr.io/graalvm/native-image-community:22-muslib-ol8              # Oracle Linux 8
FROM ghcr.io/graalvm/native-image-community:21-muslib
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



RUN microdnf install -y gzip tar && microdnf clean all

WORKDIR /app
COPY . .
RUN ./mvnw clean package

#RUN native-image --no-fallback -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
#RUN native-image --no-fallback --static --libc=musl -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo
