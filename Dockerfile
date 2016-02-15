FROM zabbix/zabbix-3.0:dev

MAINTAINER shawn qiusct@live.com

# Layer: myzabbix
COPY ./*.ttf /usr/local/src/zabbix/frontends/php/fonts/
COPY alert-agent/plugin/zabbix-plugin/110monitor /usr/local/share/zabbix/alertscripts/
COPY alert-agent /usr/local/share/zabbix/alertscripts/alert-agent

RUN \
  sed -i '55 s/false/true/g' /usr/local/src/zabbix/frontends/php/include/locales.inc.php && \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php && \
  sed -i 's/date.timezone\s=/&\ndate.timezone = Asia\/Shanghai/' /etc/php.ini && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
