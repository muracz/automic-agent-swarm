FROM frolvlad/alpine-glibc

RUN mkdir /Automic
COPY ./bins/ /Automic/
WORKDIR /Automic

ENTRYPOINT /Automic/start.sh
