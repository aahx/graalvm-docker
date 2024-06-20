## Use the specified GraalVM image as the base image
#FROM ghcr.io/graalvm/native-image-community:21.0.2-ol9-20240116
#
## Set environment variables
#ENV LANG=en_US.UTF-8 JAVA_HOME=/usr/lib64/graalvm/graalvm-community-java20
#
## Set the working directory
#WORKDIR /app
#
## Additional arguments (if still needed)
#ARG GRAALVM_VERSION
#ARG JDK_BUILD
#ARG GRAALVM_YEAR_VERSION=23
#ARG JAVA_VERSION=20
#ARG YUM_REPO
#ARG YUM_REPO_DEFAULT=https://yum.oracle.com/repo/OracleLinux/OL9/graalvm/community/
#ARG TEMP_REGION
#
## Run any additional setup commands (if needed)
#RUN echo "Setting up with GRAALVM_VERSION=${GRAALVM_VERSION}, JDK_BUILD=${JDK_BUILD}, GRAALVM_YEAR_VERSION=${GRAALVM_YEAR_VERSION}"
#
## Copy the jar file into the container (adjust the path as needed)
#COPY target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-0.0.1-SNAPSHOT.jar
#
## Run the native-image command
#RUN native-image --static -jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo-aarch-static
#
#
