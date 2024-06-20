1. Build the JAR file using Maven (mvn package).
2. Use exec-maven-plugin to run Docker commands after the JAR is created:
3. Build the Docker image:
   3.1 Ensure the Docker image has the necessary environment to run native-image.
4. Run the Docker container:
   4.1 Mount the host's target directory to the container.
   4.2 Execute the native-image command inside the container, referencing the JAR file from the mounted directory.
   4.3 Output the native executable to the mounted host directory.



1. Build the JAR file using Maven (mvn package).
2. Use exec-maven-plugin to run Docker commands after the JAR is created:
   2A. Build the Docker image:
      - Ensure the Docker image has the necessary environment to run native-image.
   2B. Run the Docker container:
      - Mount the host's target directory to the container.
      - Execute the native-image command inside the container, referencing the JAR file from the mounted directory.
      - Output the native executable to the mounted host directory.


3. Assemble in pkv-data-service file
   - Parent/ Child


