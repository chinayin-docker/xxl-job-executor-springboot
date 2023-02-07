xxl-job-executor-springboot Image
=================

[![Docker Image CI](https://github.com/chinayin-docker/xxl-job-executor-springboot/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/chinayin-docker/xxl-job-executor-springboot/actions/workflows/ci.yml)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/chinayin/xxl-job-executor-springboot?sort=semver)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/chinayin/xxl-job-executor-springboot?sort=semver)
![Docker Pulls](https://img.shields.io/docker/pulls/chinayin/xxl-job-executor-springboot)

A distributed task scheduling framework.（分布式任务调度平台XXL-JOB）

Usage
------------

You can use the image directly, e.g.

```bash
docker run --rm -it chinayin/xxl-job-executor-springboot:2.3.0
```

The images are built daily and have the security release enabled, so will contain any security updates released more
than 24 hours ago.

You can also use the images as a base for your own Dockerfile:

```bash
FROM chinayin/debian:xxl-job-executor-springboot:2.3.0
```
