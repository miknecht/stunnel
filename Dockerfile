FROM ubuntu:focal


ENV GCSFUSE_VERSION=1.2.0

RUN apt-get update -y && \
    apt-get install -y gnupg lsb-release curl && \
    curl -LJO "https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v${GCSFUSE_VERSION}/gcsfuse_${GCSFUSE_VERSION}_amd64.deb" && \
    apt-get -y install fuse stunnel net-tools && \
    apt-get clean && \
    dpkg -i "gcsfuse_${GCSFUSE_VERSION}_amd64.deb"  
#RUN apt-get -y install fuse 
#RUN apt-get -y install stunnel
#RUN apt-get -y install net-tools

RUN mkdir -p /etc/stunnel
RUN mkdir -p /etc/cert
#VOLUME ["/etc/stunnel"]

ENV BUCKET_NAME=bucket-stunnel-cloud-run-demo-403212
ENV MOUNT_POINT=/etc/stunnel

#RUN gcsfuse GLOBAL_OPTIONS BUCKET_NAME MOUNT_POINT

ADD stunnel.conf /etc/stunnel/stunnel.conf
ADD stunnel.sh /stunnel.sh

#RUN mkdir /etc/stunnel
#CMD ["gcsfuse", "bucket-stunnel-cloud-run-demo-403212", "/etc/stunnel"]

#ADD stunnel.pem /etc/stunnel/stunnel.pem

RUN set -x && chmod +x /stunnel.sh 

CMD ["/stunnel.sh"]