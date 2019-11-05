#
# This builds on the airflow container available at github
#
FROM puckel/docker-airflow:1.10.2

ENV HASHICORP_CONSUL_VER 1.6.1

USER root
RUN apt-get update && apt-get install -y unzip
RUN curl https://releases.hashicorp.com/consul/${HASHICORP_CONSUL_VER}/consul_{$HASHICORP_CONSUL_VER}_linux_amd64.zip -o consul.zip && unzip consul.zip && chmod +x consul && mv consul /usr/bin/consul
# COPY airflow-requirements.txt ${AIRFLOW_HOME}/requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
USER airflow