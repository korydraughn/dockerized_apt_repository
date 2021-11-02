FROM nginx

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https vim less reprepro

RUN mkdir -p /opt/debian/conf
COPY distributions /opt/debian/conf/distributions
COPY apt_repo.conf /etc/nginx/conf.d/apt_repo.conf

COPY start.sh /
ENTRYPOINT ["bash", "./start.sh"]
