# Publish all container's ports to the host!
# Run in hosts network 
docker run -itd -P --net=host --privileged miknecht/stunnel 
