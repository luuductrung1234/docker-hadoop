ARG BASE_VERSION

FROM hadoop-base:${BASE_VERSION:-latest}

COPY target/pi-estimation-1.0-SNAPSHOT.jar /opt/hadoop/applications/pi-estimation.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/pi-estimation.jar"
ENV CLASS_TO_RUN="com.ldt.QuasiMonteCarlo"
ENV PARAMS="10 100"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]