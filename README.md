# urbackup-docker
:floppy_disk: small docker container for urbackup

[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/tristanteu/urbackup-docker/)


`Version 2.1.18`


#### Build
```bash
$ git clone https://github.com/firsttris/urbackup-docker.git
$ cd tvheadend-sundtek-docker
$ docker build -t tristanteu/urbackup-docker .
```

#### Run:
```bash
docker pull tristanteu/urbackup-docker

docker run \
--name urbackup \
-v /etc/localtime:/etc/localtime:ro \
-v /home/docker/urbackup/:/var/urbackup \
-p 55413-55415:55413-55415 \
-p 35623:35623 \
-d urbackup/2.1.18
```

#### Notes
- on first start of urbackup set /var/urbackup to you backup directory (settings)
- mount this directory to the backup directory on your host e.g. -v /home/docker/urbackup/:/var/urbackup \
