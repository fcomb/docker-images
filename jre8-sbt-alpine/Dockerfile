FROM lwieske/java-8:server-jre-8u112-slim
MAINTAINER Timothy Klim <fcomb@timothyklim.com>

RUN adduser -D -g '' java
ENV HOME /home/java
WORKDIR ${HOME}

RUN mkdir ${HOME}/bin && \
    mkdir -p ${HOME}/.sbt/0.13/plugins
ADD https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt ${HOME}/bin/
RUN apk add --update --no-cache bash && \
    chown -R java:java ${HOME} && \
    chmod +x ${HOME}/bin/sbt

USER java
RUN ${HOME}/bin/sbt -sbt-force-latest -sbt-create -212 && \
    rm -rf ${HOME}/project ${HOME}/target
