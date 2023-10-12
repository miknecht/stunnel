FROM ubuntu

RUN apt-get update
RUN apt-get -y install stunnel
RUN apt-get -y install net-tools

RUN mkdir -p /etc/stunnel
VOLUME ["/etc/stunnel"]

ADD stunnel.conf /etc/stunnel/stunnel.conf
ADD stunnel.sh /stunnel.sh
ADD stunnel.pem /etc/stunnel/stunnel.pem

RUN set -x && chmod +x /stunnel.sh 

CMD ["/stunnel.sh"]