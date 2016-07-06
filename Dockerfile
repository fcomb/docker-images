FROM anapsix/alpine-java:jre8
MAINTAINER Timothy Klim <fcomb@timothyklim.com>

RUN adduser -D -g '' java
WORKDIR /home/java

RUN mkdir /home/java/bin && \
    mkdir -p /home/java/.sbt/0.13/plugins && \
    echo 'addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-M12-1")' > /home/java/.sbt/0.13/plugins/plugins.sbt
ADD https://raw.githubusercontent.com/TimothyKlim/sbt-extras/master/sbt /home/java/bin/
RUN chown -R java:java /home/java && \
    chmod +x /home/java/bin/sbt

USER java
RUN /home/java/bin/sbt -sbt-force-latest -sbt-create -211
