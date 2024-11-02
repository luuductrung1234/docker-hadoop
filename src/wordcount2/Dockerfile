ARG BASE_VERSION

FROM hadoop-base:${BASE_VERSION:-latest}

ENV DATA_FILEPATH="/tmp/data.txt"
RUN curl "https://www.gutenberg.org/files/203/203-0.txt" -o ${DATA_FILEPATH}

COPY target/wordcount2-1.0-SNAPSHOT.jar /opt/hadoop/applications/wordcount2.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/wordcount2.jar"
ENV CLASS_TO_RUN="com.ldt.wordcount2.WordCount"
ENV INPUT_DIR_PARAMS="/input"
ENV OUTPUT_DIR_PARAMS="/output"

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]