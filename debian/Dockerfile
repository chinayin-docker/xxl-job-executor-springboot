#
#
#--------------------------------------------------------------------------
# 2-bullseye-slim
#--------------------------------------------------------------------------
#

FROM chinayin/maven:3-jdk-8 AS builder

COPY prebuildfs /
RUN set -eux \
    ## install packages
    && install_packages git file \
    && mkdir /app
WORKDIR /app

ENV XXL_VERSION 2.4.0
ENV XXL_GIT_TAG 2.4.0

RUN set -eux \
    && git clone https://github.com/xuxueli/xxl-job.git -b ${XXL_GIT_TAG} . \
    && mvn -B package --file pom.xml

FROM chinayin/openjdk:8-jre

ENV TZ=PRC

RUN set -eux \
    && mkdir /app

WORKDIR /app

COPY startup.sh /app
COPY --from=builder /app/xxl-job-executor-samples/xxl-job-executor-sample-springboot/target/xxl-job-executor-*.jar /app/xxl-job-executor.jar

EXPOSE 9999

CMD [ "./startup.sh" ]
