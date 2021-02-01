# Hoverfly (docker image)

Simple [docker] image for running [hoverfly] in webserver mode.

This image requires a `simulation.json` to be provided in `/var/hoverfly` to setup the webserver. An example `simulation.json` can be found in [example/simulation.json](example/simulation.json).

To run hoverfly in simulation mode for a provided simulation file just run:

```shell
docker run -it -p 8888:8888 -p 8500:8500 -v example:/var/hoverfly/ ghashange/hoverfly:latest
```

## Create a simulation.json

> A local installation of [**hoverctl**](https://hoverfly.readthedocs.io/en/latest/pages/introduction/downloadinstallation.html) is needed for this.

The simplest and most efficient way to get a `simulation.json` covering your needs is to use hoverfly as proxy in capture-mode to extract afterwards your request-responses into a newly created awesome looking clean `simulation.json`[hoverfly-tutorial](https://hoverfly.readthedocs.io/en/latest/pages/tutorials/basic/exportingsimulations/exportingsimulations.html):

```shell
hoverctl start
hoverctl mode capture
curl --proxy http://localhost:8500 http://time.jsontest.com
hoverctl export simulation.json
```

[docker]: https://www.docker.com
[hoverfly]: https://hoverfly.readthedocs.io/en/latest/
