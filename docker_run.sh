# Publish all container's ports to the host!
# Run in hosts network 
# Run with privileged for gcsfuse
docker run -itd -P \
 -e BUCKET_NAME='bucket-stunnel-cloud-run-demo-403212' \
 -e CONNECT='localhost:80' \
 -e ACCEPT='0.0.0.0:8090' \
--net=host --privileged miknecht/stunnel

