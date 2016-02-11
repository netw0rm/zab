FROM zabbix/zabbix-2.4:latest

MAINTAINER shawn qiusct@live.com

# Layer: myzabbix
COPY ./*.ttf /usr/local/src/zabbix/frontends/php/fonts/
RUN \
  sed -i 's/DejaVuSans/msyh/g' /usr/local/src/zabbix/frontends/php/include/defines.inc.php && \
  sed -i 's/date.timezone\s=/&\ndate.timezone = Asia\/Shanghai/' /etc/php.ini && \
  sed -i '435c table.history td.caption { font-weight: bold; }' /usr/local/src/zabbix/frontends/php/styles/default.css && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  wget -q http://cdn.110monitor.com/open/download/4.1.3.1/alert-agent-4.1.3.1-linux-x64.tar.gz -O - | tar -zxf - && \
  cp alert-agent/plugin/zabbix-plugin/110monitor /usr/lib/zabbix/alertscripts/ && \
  mv alert-agent /usr/lib/zabbix/alertscripts
