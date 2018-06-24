# Hoverfly (docker image)

Simple [docker] image for running [hoverfly] in webserver mode.

This image requires a `simulation.json` to be provided in `/var/hoverfly` to setup the webserver. An example `simulation.json` can be found in [example/simulation.json](example/simulation.json).

To run the image:

```shell
docker run -it -p 8888:8888 -p 8500:8500 -v example:/var/hoverfly/ ghashange/hoverfly:latest
```

[docker]: https://www.docker.com
[hoverfly]: https://hoverfly.readthedocs.io/en/latest/
