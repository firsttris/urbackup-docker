FROM debian:latest
ENV VERSION 2.1.19
MAINTAINER Tristan Teufel <info@teufel-it.de>

RUN apt-get update
RUN apt-get install sqlite3 libcrypto++9 libcurl3 libfuse2 -y

ADD https://www.urbackup.org/downloads/Server/${VERSION}/debian/stable/urbackup-server_${VERSION}_amd64.deb /root/urbackup.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /root/urbackup.deb  || true

ADD backupfolder /etc/urbackup/backupfolder
RUN chmod +x /etc/urbackup/backupfolder

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623

VOLUME [ "/var/urbackup", "/var/log", "/backup"]
ENTRYPOINT ["/usr/bin/urbackupsrv"]
CMD ["run"]
