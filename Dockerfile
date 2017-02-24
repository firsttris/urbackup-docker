FROM debian:latest
ENV VERSION 2.1.18
MAINTAINER Tristan Teufel <info@teufel-it.de>

ADD https://www.urbackup.org/downloads/Server/${VERSION}/debian/stable/urbackup-server_${VERSION}_amd64.deb /root/urbackup.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /root/urbackup.deb  || true

RUN apt-get update
RUN apt-get install -y -f

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623

VOLUME [ "/var/urbackup", "/var/log"]
ENTRYPOINT ["/usr/bin/urbackupsrv"]
CMD ["run"]
