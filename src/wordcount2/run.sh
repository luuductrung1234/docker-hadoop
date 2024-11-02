#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -test -d $INPUT_DIR_PARAMS
if [ $? -ne 0 ]; then
    echo "Input directory does not exist. Creating directory: $INPUT_DIR_PARAMS"
    $HADOOP_HOME/bin/hdfs dfs -mkdir -p $INPUT_DIR_PARAMS
else
    echo "Input directory already exists: $INPUT_DIR_PARAMS"
fi

$HADOOP_HOME/bin/hdfs dfs -copyFromLocal $DATA_FILEPATH $INPUT_DIR_PARAMS

$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $INPUT_DIR_PARAMS $OUTPUT_DIR_PARAMS

$HADOOP_HOME/bin/hdfs dfs -cat "$OUTPUT_DIR_PARAMS/*"

$HADOOP_HOME/bin/hdfs dfs -cat "/user/root/stopwatch/wordcount2-perm.txt"

$HADOOP_HOME/bin/hdfs dfs -rm -r $INPUT_DIR_PARAMS

$HADOOP_HOME/bin/hdfs dfs -rm -r $OUTPUT_DIR_PARAMS
