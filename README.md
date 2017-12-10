# urbackup-docker
:floppy_disk: docker container for urbackup-server

[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/tristanteu/urbackup-docker/)

`Version 2.1.20`

UrBackup is an easy to setup Open Source client/server backup system, that through a combination of image and file backups accomplishes both data safety and a fast restoration time.

[www.urbackup.org](https://www.urbackup.org/index.html)


### Pull:
```bash
docker pull tristanteu/urbackup-docker
```

### Run:
```bash
docker run \
--name urbackup \
--restart=always \
-v /etc/localtime:/etc/localtime:ro \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--net="host" \
-d tristanteu/urbackup-docker
```

### WebUI
yourserverip:55414

### Show all Cli Commands
```bash
docker run \
--rm tristanteu/urbackup-docker --help
```

### Remove-Unkown
Cleaning the backup folder of files not known by UrBackup Database  
[urbackup dokumentation](https://www.urbackup.org/administration_manual.html#x1-10000011.4)  
```bash
docker run \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--rm tristanteu/urbackup-docker remove-unknown
```

### Cleanup
Percent of space to free on the backup storage or the number of Bytes/ Megabytes/ Gigabytes e.g. “20G” or “10%”.  
If it should only delete old backups use “0%”.  
[urbackup dokumentation](https://www.urbackup.org/administration_manual.html#x1-9900011.3)  
```bash
docker run \
-v /home/docker/urbackup/db/:/var/urbackup \
-v /media/8tb.wd.red/backup/:/backup \
--rm tristanteu/urbackup-docker cleanup --amount 0%
```

### Network Mode
if you don't want to use net="host" you can expose the following ports
```bash
-p 55413-55415:55413-55415 \
-p 35623:35623 \
```

### Build
```bash
$ git clone https://github.com/firsttris/urbackup-docker.git
$ cd urbackup-docker
$ docker build -t tristanteu/urbackup-docker .
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

## Code of Conduct
See the [CODE](CODE_OF_CONDUCT.md)


## License
See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
