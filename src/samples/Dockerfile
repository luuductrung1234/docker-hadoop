ARG BASE_VERSION

FROM hadoop-base:${BASE_VERSION:-latest}

ARG SAMPLE_TO_RUN
ARG SAMPLE_PARAMS

COPY target/samples-1.0-SNAPSHOT.jar /opt/hadoop/applications/samples.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/samples.jar"
ENV CLASS_TO_RUN="com.ldt.samples.${SAMPLE_TO_RUN}"
ENV PARAMS=${SAMPLE_PARAMS}

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]