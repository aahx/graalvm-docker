# Step 1: Build the Docker image
docker build -t test1 .

# Step 2: Check if was created / start an interactive bash shell
docker run -it --entrypoint /bin/bash test1
ls -l
ls -l target

# (Optional) Step 3: Create the target directory on your local machine
mkdir -p /Users/michaelkim/Desktop/demo/target1

# Step 4: Create a temporary Docker container from the built image
docker create --name temp-container test1

# Step 5: Copy the demo executable from the Docker container to your local machine
docker cp temp-container:/app/target/demo /Users/michaelkim/Desktop/demo/target1

# Step 5: Remove the temporary Docker container
docker rm temp-container



Next Steps:

--> Check file type of copied file... is it actually Linux?
`$ file ./demo`
```
./demo: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=f69d4523e1178e66252f08c7d1b39e02eb3b40b2, for GNU/Linux 3.7.0, not stripped
```

--> dynamically linked - changed to statically linked 
docker pull ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol8-20240416


--> Try with `Target` not `Target1`

--> Try removing main
--> Try adding Spring Boot

--> Change Pom File to Execute on Maven Package phase
