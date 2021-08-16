[![](https://images.microbadger.com/badges/version/neomediatech/dcc.svg)](https://microbadger.com/images/neomediatech/dcc "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/neomediatech/dcc.svg)](https://microbadger.com/images/neomediatech/dcc)
![](https://img.shields.io/github/last-commit/Neomediatech/dcc-docker.svg?style=plastic)
![](https://img.shields.io/github/repo-size/Neomediatech/dcc-docker.svg?style=plastic)
[![Docker Pulls](https://img.shields.io/docker/pulls/neomediatech/dcc.svg?style=plastic)](https://hub.docker.com/r/neomediatech/dcc/)

# Preface
DCC is acronym of Distributed Checksum Clearinghouses. DCC is an anti-spam content filter that runs on a variety of operating systems. See https://en.wikipedia.org/wiki/Distributed_Checksum_Clearinghouse or https://www.dcc-servers.net/dcc/ for details.

# What's in?
This is a repo for Docker image containing e compiled version of DCC

# Some details
 - Docker image is based on debian:stable-slim
 - DCC starts as daemon listening on 10030/tcp port (maybe configurable in future releases)

# Example to start a container
docker run --name dcc --restart=always -p 127.0.0.1:10030:10030 -d neomediatech/dcc
