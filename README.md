[![Docker Automated build](https://img.shields.io/docker/automated/behskenadze/transmission-lightweight.svg?maxAge=2592000)](https://hub.docker.com/r/beshkenadze/transmission-lightweight/)

Based on [dperson/transmission](https://github.com/dperson/transmission)

[![logo](https://raw.githubusercontent.com/dperson/transmission/master/logo.png)](https://www.transmissionbt.com/)

# Transmission

Transmission docker container

# What is Transmission?

Transmission is a BitTorrent client which features a simple interface on top of
a cross-platform back-end.

# How to use this image

This Transmission container was built to automatically download a level1 host
filter (can be used with dperson/openvpn).

    sudo docker run -it --cap-add=NET_ADMIN --device /dev/net/tun --name vpn \
                --dns 8.8.4.4 --dns 8.8.8.8 --restart=always \
                -d dperson/openvpn-client ||
    sudo docker run -it --name bit --net=container:vpn \
                -d beshkenadze/transmission-lightweight
    sudo docker run -it --name web -p 80:80 -p 443:443 --link vpn:bit \
                -d dperson/nginx -w "http://bit:9091/transmission;/transmission"

**NOTE**: The default username/password are `admin`/`admin`. See `TRUSER` and
`TRGROUP` below, for how to change them.

## Hosting a Transmission instance

    sudo docker run -it --name transmission -p 9091:9091 -d beshkenadze/transmission-lightweight

OR set local storage:

    sudo docker run -it --name transmission -p 9091:9091 \
                -v /path/to/directory:/home/transmission \
                -d beshkenadze/transmission-lightweight

**NOTE**: The configuration is in `/home/transmission/info`, downloads
are in `/home/transmission/downloads`, and partial downloads are in
`/home/transmission/incomplete`.

## Configuration

    sudo docker run -it --rm beshkenadze/transmission-lightweight -h

    Usage: transmission.sh [-opt] [command]
    Options (fields in '[]' are optional, '<>' are required):
        -h          This help
        -n          No auth config; don't configure authentication at runtime
        -t ""       Configure timezone
                    possible arg: "[timezone]" - zoneinfo timezone for container

    The 'command' (if provided and valid) will be run instead of transmission

ENVIRONMENT VARIABLES (only available with `docker run`)

 * `TRUSER` - Set the username for transmission auth (default 'admin')
 * `TRPASSWD` - Set the password for transmission auth (default 'admin')
 * `TZ` - As above, configure the zoneinfo timezone, IE `EST5EDT`
 * `USERID` - Set the UID for the app user
 * `GROUPID` - Set the GID for the app user

Other environment variables beginning with `TR_` will edit the configuration
file accordingly:

 * `TR_MAX_PEERS_GLOBAL=400` will translate to `"max-peers-global": 400,`

## Examples

Any of the commands can be run at creation with `docker run` or later with
`docker exec -it transmission.sh` (as of version 1.3 of docker).

### Setting the Timezone

    sudo docker run -it --name transmission -d beshkenadze/transmission-lightweight -t EST5EDT

OR using `environment variables`

    sudo docker run -it --name transmission -e TZ=EST5EDT \
                -d beshkenadze/transmission-lightweight

Will get you the same settings as

    sudo docker run -it --name transmission -p 9091:9091 -d beshkenadze/transmission-lightweight
    sudo docker exec -it transmission transmission.sh -t EST5EDT \
                ls -AlF /etc/localtime
    sudo docker restart transmission

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact me
through a [GitHub issue](https://github.com/beshkenadze/transmission-lightweight/issues).
