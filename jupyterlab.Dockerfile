FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.0.0
ARG jupyterlab_version=2.1.5

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    apt-get install unzip && \

    # install java-8
    apt install -y openjdk-11-jdk-headless && \
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 &&\

    pip install kaggle && \
    pip install pandas && \
    pip install matplotlib && \
    pip install sklearn && \
    pip install pyarrow && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version}



# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=