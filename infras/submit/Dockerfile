ARG BASE_VERSION

FROM hadoop-base:${BASE_VERSION:-latest}

COPY WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/input /output"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
