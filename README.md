# docker-radarr
Installs Radarr into a Linux Container


![Radarr](https://raw.githubusercontent.com/Radarr/Radarr/aphrodite/Logo/128.png)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-radarr/blob/master/Dockerfile_alpine)

## Description

Radarr is an independent fork of Sonarr reworked for automatically downloading movies via Usenet and BitTorrent. The project was inspired by other Usenet/BitTorrent movie downloaders such as CouchPotato.

https://radarr.videos

## Usage
    docker create --name=radarr \
      -v /etc/localtime:/etc/localtime:ro \
      -v <path to config>:/config \
      -e DOCKUID=<UID default:10032> \
      -e DOCKGID=<GID default:10032> \
      -e DOCKUPGRADE=<0|1> \
      -p 7878:7878 \
      digrouz/radarr

## Environment Variables

When you start the `radarr` image, you can adjust the configuration of the `radarr` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10032`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10032`.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

## Notes

* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e DOCKUPGRADE=1` at container creation.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-radarr/issues)
