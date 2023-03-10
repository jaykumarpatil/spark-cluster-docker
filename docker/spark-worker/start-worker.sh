#!/bin/bash

source ${SPARK_HOME}/sbin/spark-config.sh
source ${SPARK_HOME}/bin/load-spark-env.sh

mkdir -p $SPARK_WORKER_LOG

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

cd ${SPARK_HOME}/bin && ${SPARK_HOME}/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out