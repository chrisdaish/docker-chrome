Google Chrome
=============

Unofficial build of Google Chrome 42 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v1.0
* User permissions now correlate between host and container. This allows Google-Chrome downloads to be saved back to the host system by passing in the local users uid/gid as environment variables.
* Added audio passthrough, however this requires the --privileged argument to be set. This can be replaced with --device:/dev/snd in Docker 1.7.
* Additional configuration files can now be mounted inside the container (see example below).
* Additional environment variables can now be passed into the container for additional ARGS and URL. For example: -e ARGS=--proxy-pac-url='<Insert URL HERE>' -e URL=http://www.docker.com
```

Launch Command
---------------
```
docker run  -v $HOME/Downloads:/home/google-chrome/Downloads:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /dev/snd:/dev/snd \
            --privileged \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            --rm \
            --name google-chrome \
            chrisdaish/google-chrome
```

FAQ
---
Note: If you receive the following Gtk error:
```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session
```
xhost +local:docker
```
