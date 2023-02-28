# Use a recent version of OpenJDK
FROM adoptopenjdk/openjdk11:latest
LABEL author="Jay Kumar Patil" email="jaypatil3004@gmail.com"
LABEL version="0.2"

# Define build-time arguments
ENV SBT_BASE_URL=https://github.com/sbt/sbt/releases/download
ARG SBT_VERSION=1.5.5
ENV SBT_VERSION=${SBT_VERSION}

ENV SCALA_BASE_URL=https://github.com/lampepfl/dotty/releases/download
ARG SCALA_VERSION=3.2.2
ENV SCALA_VERSION=${SCALA_VERSION}

ENV SPARK_BASE_URL=https://dlcdn.apache.org/spark
ARG SPARK_VERSION=3.3.2
ENV SPARK_VERSION=${SPARK_VERSION}

ARG HADOOP_VERSION=3
ARG PYTHON_VERSION=3.9.9
RUN apt-get update \
    && apt-get install -y wget 
# Install necessary packages using a package manager
# RUN apt-get update \
#     && apt-get install -y curl vim wget software-properties-common ssh net-tools ca-certificates jq dbus-x11 python3 python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy \
#     && update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1 \
#     && apt-get clean

# Download and install Scala
RUN wget --no-verbose ${SCALA_BASE_URL}/${SCALA_VERSION}/scala3-${SCALA_VERSION}.tar.gz \
    && tar -xvzf scala3-${SCALA_VERSION}.tar.gz \
    && mv scala3-${SCALA_VERSION} /usr/local/scala \
    && ln -s /usr/local/scala /usr/bin/ \
    && rm scala3-${SCALA_VERSION}.tar.gz

# Download and install SBT
RUN wget --no-verbose ${SBT_BASE_URL}/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz \
    && tar -xvzf sbt-${SBT_VERSION}.tgz \
    && mv sbt /usr/local/sbt \
    && ln -s /usr/local/sbt /usr/bin/ \
    && rm sbt-${SBT_VERSION}.tgz

# Download and install Spark spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
RUN wget ${SPARK_BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /usr/local/spark \
    && ln -s /usr/local/spark /usr/bin/ \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Set environment variables for Spark and Scala
ENV SPARK_HOME=/usr/bin/spark
ENV SCALA_HOME=/usr/bin/scala
ENV PATH=$PATH:${SCALA_HOME}/bin:${SPARK_HOME}/bin:${SPARK_HOME}/sbin

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1