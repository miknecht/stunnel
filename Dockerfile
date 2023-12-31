FROM ubuntu:focal

ENV GCSFUSE_VERSION=1.2.0
ENV MOUNT_POINT=/etc/cert

RUN apt-get update -y && \
    apt-get install -y gnupg lsb-release curl && \
    curl -LJO "https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v${GCSFUSE_VERSION}/gcsfuse_${GCSFUSE_VERSION}_amd64.deb" && \
    apt-get -y install fuse stunnel4 net-tools && \
    apt-get clean && \
    dpkg -i "gcsfuse_${GCSFUSE_VERSION}_amd64.deb"  

RUN mkdir -p /etc/stunnel
RUN mkdir -p /etc/cert

ADD stunnel.sh /stunnel.sh

RUN set -x && chmod +x /stunnel.sh 

CMD ["/stunnel.sh"]