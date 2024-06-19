### Step 1: Build the Docker image
docker build -t test1 .
docker buildx build --platform linux/amd64 -t test1 .

### Step 2: Check if was created / start an interactive bash shell
docker run -it --entrypoint /bin/bash test1
ls -l
ls -l target

### (Optional) Step 3: Create the target directory on your local machine
mkdir -p /Users/michaelkim/Desktop/demo/target1

### Step 4: Create a temporary Docker container from the built image
docker create --name temp-container test1
--> (haven't tried) docker create your-image-name:latest /bin/bash

### Step 5: Copy the demo executable from the Docker container to your local machine
docker cp temp-container:/app/target/demo /Users/michaelkim/Desktop/demo/target1
- docker cp a50232030636:app/hs_err_pid30.log ./
- docker cp <containerId>:app/target/demo {workingdirectory}/target

### Step 5: Remove the temporary Docker container
docker rm temp-container


<hr />


# Next Steps:

### 1. Check file type of copied file... is it actually Linux?
`$ file ./demo`
```
./demo: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=f69d4523e1178e66252f08c7d1b39e02eb3b40b2, for GNU/Linux 3.7.0, not stripped
```

#### yes

<br />
<br />
<br />


---

### 2. Change to Muslib (FAILED) NOT WORKING :'(

List of Packages:
https://www.graalvm.org/latest/docs/getting-started/container-images/
  https://github.com/orgs/graalvm/packages
  
Story:
  https://github.com/graalvm/container/pkgs/container/native-image-community

Attempted: +
```
  ghcr.io/graalvm/native-image-community:latest
  ghcr.io/graalvm/graalvm-community:21.0.0-muslib-ol9
  ghcr.io/graalvm/native-image-community:22.0.1-muslib-ol8-20240416

```

Asking the community:
- https://github.com/oracle/graal/issues/9142
- https://stackoverflow.com/questions/78640397/issuing-building-static-linked-executables-with-graalvm-docker-community-image

---



<br />
<br />
<br />


### 3 --> Try with `Target` not `Target1`
### 4 --> Try removing main
### 5 --> Try adding Spring Boot
### 6 --> Change Pom File to Execute on Maven Package phase
