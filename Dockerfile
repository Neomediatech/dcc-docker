FROM debian:stable-slim

ENV DCC_VERSION=2.3.166
ENV DCC_BUILD_DATE=2019-06-05
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome

LABEL maintainer="docker-dario@neomediatech.it" \ 
      org.label-schema.version=$DCC_VERSION \
      org.label-schema.build-date=$DCC_BUILD_DATE \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/dcc-docker \
      org.label-schema.maintainer=Neomediatech \
      it.neomediatech.dcc.pkg-url="https://www.dcc-servers.net/dcc/source/old/"

# Download & Compile DCC
RUN apt-get -yq update && apt-get -y --no-install-recommends install \
    apt-utils ca-certificates curl gcc libc-dev make && \
    curl https://www.dcc-servers.net/dcc/source/old/dcc-${DCC_VERSION}.tar.Z | tar xzf - -C /tmp && ls -l /tmp && \
    cd /tmp/dcc-${DCC_VERSION} && ./configure --disable-dccm && make install && \
    apt-get purge -yq binutils cpp gcc libc6-dev linux-libc-dev make && \
    apt-get -y autoremove --purge && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/log/*

COPY dcc_conf /var/dcc/dcc_conf
COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ENV USER_UID=1000
ENV USER_GID=1000

EXPOSE 10030

CMD ["/usr/local/bin/start.sh"]
