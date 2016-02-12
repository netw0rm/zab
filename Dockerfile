FROM zabbix/zabbix-3.0:dev

MAINTAINER shawn qiusct@live.com

# Layer: myzabbix
COPY ./*.ttf /usr/local/src/zabbix/frontends/php/fonts/
RUN \
  sed -i '55 s/false/true/g' /usr/local/src/zabbix/frontends/php/include/locales.inc.php && \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php && \
  sed -i 's/date.timezone\s=/&\ndate.timezone = Asia\/Shanghai/' /etc/php.ini && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  wget -q http://cdn.110monitor.com/open/download/4.1.3.1/alert-agent-4.1.3.1-linux-x64.tar.gz -O - | tar -zxf - && \
  cp alert-agent/plugin/zabbix-plugin/110monitor /usr/lib/zabbix/alertscripts/ && \
  mv alert-agent /usr/lib/zabbix/alertscripts
