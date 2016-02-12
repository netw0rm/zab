FROM zabbix/zabbix-2.4:latest

MAINTAINER shawn qiusct@live.com

# Layer: myzabbix
COPY ./*.ttf /usr/local/src/zabbix/frontends/php/fonts/ && \
COPY alert-agent/plugin/zabbix-plugin/110monitor /usr/lib/zabbix/alertscripts/ && \
COPY alert-agent /usr/lib/zabbix/alertscripts/

RUN \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php && \
  sed -i 's/date.timezone\s=/&\ndate.timezone = Asia\/Shanghai/' /etc/php.ini && \
  sed -i '435c table.history td.caption { font-weight: bold; }' /usr/local/src/zabbix/frontends/php/styles/default.css && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
