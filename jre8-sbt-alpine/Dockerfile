FROM anapsix/alpine-java:jre8
MAINTAINER Timothy Klim <fcomb@timothyklim.com>

RUN adduser -D -g '' java
ENV HOME /home/java
WORKDIR ${HOME}

RUN mkdir ${HOME}/bin && \
    mkdir -p ${HOME}/.sbt/0.13/plugins && \
    echo 'addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-M13")' > ${HOME}/.sbt/0.13/plugins/plugins.sbt
ADD https://raw.githubusercontent.com/TimothyKlim/sbt-extras/0.13.12/sbt ${HOME}/bin/
RUN chown -R java:java ${HOME} && \
    chmod +x ${HOME}/bin/sbt

USER java
RUN ${HOME}/bin/sbt -sbt-force-latest -sbt-create -211 && \
    rm -rf ${HOME}/project ${HOME}/target
