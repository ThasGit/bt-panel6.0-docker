FROM centos:7

MAINTAINER thas thascc1024@gmail.com

ENV USERNAME=btpanel PASSWORD=btpanel

RUN yum install -y wget \
&& wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
&& sh -c  '/bin/echo -e "y" | sh install.sh'
RUN sh -c  '/bin/echo -e "$PASSWORD" | /bin/bt 5' \
&& sh -c  '/bin/echo -e "$USERNAME" | /bin/bt 6' \
&& /bin/bt 11

EXPOSE 8888 888 80 443 21

VOLUME /www

COPY start.sh /data/start.sh
COPY stop.sh /data/stop.sh
COPY entry.sh /data/entry.sh

WORKDIR /data

RUN chown root:root /data/*.sh && chmod 700 /data/*.sh

ENTRYPOINT ["/data/entry.sh"]



