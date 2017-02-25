# urbackup-docker
:floppy_disk: small docker container for urbackup

[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/tristanteu/urbackup-docker/)

`Version 2.1.18`

### Build
```bash
$ git clone https://github.com/firsttris/urbackup-docker.git
$ cd urbackup-docker
$ docker build -t tristanteu/urbackup-docker .
```
### Pull:
```bash
docker pull tristanteu/urbackup-docker
```

### Run:
```bash
docker run \
--name urbackup \
-v /etc/localtime:/etc/localtime:ro \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--net="host" \
-d tristanteu/urbackup-docker
```

### Remove-Unkown
```bash
docker run \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--rm tristanteu/urbackup-docker remove-unknown
```

### Cleanup
```bash
docker run \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--rm tristanteu/urbackup-docker cleanup
```

### All Commands
```bash
docker run \
--rm tristanteu/urbackup-docker --help
```

### alternative to Network Mode
if you don't want to use net="host" you can expose the following ports
```bash
-p 55413-55415:55413-55415 \
-p 35623:35623 \
```

### Important - First Start
- on the first start urbackup complains about the backup directory  
- set /backup to your backup directory (settings)  
- mount this directory to your actual backup directory on your host  
`-v /media/12TBWDRED/yourActualBackupDirectory/:/backup`
- ensure correct permissions on the host folders your mounting  
e.g.  
```bash
chmod 777 -R /home/docker/urbackup/  
chmod 777 -R /media/8tb.wd.red/backup/
```
