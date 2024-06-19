RUN
native-image
[options]

    --no-fallback
      build stand-alone image or report failure


    --report-unsupported-elements-at-runtime 
      report usage of unsupported methods and fields at run time when they are accessed the first time, instead of 
      as an error during image building


    --libc
      selects the libc implementation to use. Available implementations: glibc, musl, bionic
    
    MAKE SURE THIS IS INSTALLED***
    --static              
      **build statically linked executable (requires static libc and zlib)**

    --march
        generate instructions for a specific machine type. Defaults to 'x86-64-v3' on AMD64 and 'armv8-a' on AArch64. 
        Use-march=compatibility for best compatibility, or -march=native for best performance if the native executable is 
        deployed on the same machine or on a machine with the same CPU features. To list all available machine types, use -march=list.

jar jarfile [imagename] [options]

-jar /app/target/demo-0.0.1-SNAPSHOT.jar /app/target/demo