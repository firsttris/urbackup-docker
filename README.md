# urbackup-docker
:floppy_disk: small docker container for urbackup

[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/tristanteu/urbackup-docker/)

`Version 2.1.18`

#### Build
```bash
$ git clone https://github.com/firsttris/urbackup-docker.git
$ cd urbackup-docker
$ docker build -t tristanteu/urbackup-docker .
```

#### Run:
```bash
docker pull tristanteu/urbackup-docker

docker run \
--name urbackup \
-v /etc/localtime:/etc/localtime:ro \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--net="host" \
-d tristanteu/urbackup-docker
```

#### Important - First Start
- on the first start urbackup complains about the backup directory  
- set /backup to your backup directory (settings)  
- mount this directory to your actual backup directory on your host  
`-v /media/12TBWDRED/yourActualBackupDirectory/:/backup`
- ensure correct permissions on the host folders your mounting  
e.g.  
chmod 777 -R /home/docker/urbackup/  
chmod 777 -R /media/8tb.wd.red/backup/
