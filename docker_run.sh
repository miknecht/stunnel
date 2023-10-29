# Publish all container's ports to the host!
# Run in hosts network 
# Run with privileged for gcsfuse
docker run -itd -P --net=host --privileged miknecht/stunnel 
