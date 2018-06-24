FROM golang:1.10.3-alpine3.7

LABEL author="Siyavash Habashi (janjaali)"

ARG hoverfly_version=0.17.0
ARG hoverfly_archive=/tmp/hoverfly-${hoverfly_version}

ADD https://github.com/SpectoLabs/hoverfly/archive/v${hoverfly_version}.zip ${hoverfly_archive}

ARG source_directory=/go/src/github.com/SpectoLabs/

RUN mkdir -p ${source_directory} \
    && unzip ${hoverfly_archive} -d ${source_directory} \
    && mv ${source_directory}/hoverfly-${hoverfly_version} ${source_directory}/hoverfly

RUN go install github.com/SpectoLabs/hoverfly/core/cmd/hoverfly/

ENV webserver_port=8500
ENV admin_port=8888

RUN mkdir /var/hoverfly
VOLUME [ "/var/hoverfly" ]

EXPOSE ${admin_port} ${webserver_port}

CMD exec /go/bin/hoverfly -pp ${webserver_port} -ap ${admin_port} -listen-on-host 0.0.0.0 -import /var/hoverfly/simulation.json -webserver 
