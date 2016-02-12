<?xml version="1.0" encoding="UTF-8"?>
<!--

    NOTE: This copyright does *not* cover user programs that use HQ
    program services by normal system calls through the application
    program interfaces provided as part of the Hyperic Plug-in Development
    Kit or the Hyperic Client Development Kit - this is merely considered
    normal use of the program, and does *not* fall under the heading of
     "derived work".

     Copyright (C) [2009-2010], VMware, Inc.
     This file is part of HQ.

     HQ is free software; you can redistribute it and/or modify
     it under the terms version 2 of the GNU General Public License as
     published by the Free Software Foundation. This program is distributed
     in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
     even the implied warranty of MERCHANTABILITY or FITNESS FOR A
     PARTICULAR PURPOSE. See the GNU General Public License for more
     details.

     You should have received a copy of the GNU General Public License
     along with this program; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
     USA.


-->

<!DOCTYPE log4j:configuration PUBLIC "-//LOGGER" "log4j.dtd">

<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">

	<!-- ============================== -->
	<!-- Appenders -->
	<!-- ============================== -->

	<!-- Provides Console Logging -->
	<appender name="CONSOLE" class="org.apache.log4j.ConsoleAppender">
		<param name="Target" value="System.out" />

		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%d{dd-MM-yyyy HH:mm:ss,SSS z} %-5p [%t] [%c@%L] %m%n" />
		</layout>
	</appender>


	<!--  Provides File Logging  -->
	<appender name="FILE" class="org.apache.log4j.DailyRollingFileAppender">
		<param name="File" value="../log/agent.log" />
		<param name="Append" value="true" />
		<param name="DatePattern" value="'.'yyyy-MM-dd" />

		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%d{dd-MM-yyyy HH:mm:ss,SSS z} %-5p [%t] [%c@%L] %m%n" />
		</layout>
	</appender>

	<!--
		A SYSLOG Appender for use with the SyslogAction class. To enable, make
		sure the syslogd on the box has been started with '-r' so that it
		accepts network connections. Separately, you'll need to enable the
		alert gui by setting the SYSLOG_ALERTS_ENABLED attribute in the HQ
		database's EAM_CONFIG_PROPS table to 'true'.
	-->

	<!--
		<appender name="SYSLOG" class="org.apache.log4j.net.SyslogAppender">
		<errorHandler class="org.apache.log4j.helpers.OnlyOnceErrorHandler" />
		<param name="Facility" value="SYSLOG" /> <param
		name="FacilityPrinting" value="true" /> <param name="SyslogHost"
		value="localhost" /> <layout class="org.apache.log4j.PatternLayout">
		<param name="ConversionPattern" value="%c{1}[%r]: %m%n" /> </layout>
		</appender> <logger
		name="org.hyperic.hq.bizapp.server.action.log.SyslogAction"> <level
		value="ERROR" /> <appender-ref ref="SYSLOG" /> </logger>
	-->


	<!-- ====================== -->
	<!-- ASYNC Appender for all Logging -->
	<!-- ====================== -->

	<appender name="ASYNC" class="org.apache.log4j.AsyncAppender">
		<appender-ref ref="FILE" />
		<!--
    <appender-ref ref="SMTP"/>
    -->
	</appender>

	<!-- ============================== -->
	<!-- 3rd party loggers -->
	<!-- ============================== -->

	<logger name="org.springframework">
		<level value="warn" />
	</logger>

	<logger name="org.springframework.core">
		<level value="info" />
	</logger>

	<logger name="org.springframework.beans">
		<level value="info" />
	</logger>

	<logger name="org.springframework.context">
		<level value="info" />
	</logger>

	<logger name="org.springframework.web">
		<level value="info" />
	</logger>
	
	<logger name="org.apache.tools.ant">
		<level value="error" />
	</logger>

	<!-- Turn off form validation messages -->
	<logger name="org.apache.commons.validator.ValidatorResources">
		<level value="OFF" />
	</logger>

        <!-- turn off "handling transient entity in delete processing" log message when pojos are deleted -->
        <logger name="org.hibernate.event.def.DefaultLoadEventListener">
            <level value="OFF" />
        </logger>

        <!-- turn off "handling transient entity in delete processing" log message when pojos are deleted -->
        <logger name="org.hibernate.event.def.DefaultDeleteEventListener">
            <level value="OFF" />
        </logger>

	<!-- Turn off form struts messages -->
	<logger name="org.apache.struts">
		<level value="OFF" />
	</logger>
	
	<!-- Turn off useless error messages, HHQ-3920 -->
	<logger name="org.hibernate.cache.ReadWriteCache">
  		<level value="OFF"/>
	</logger>

        <!-- HHQ-4744, turn off hibernate logging of StaleStateException, all errors are logged in HQ -->
        <logger name="org.hibernate.event.def.AbstractFlushingEventListener">
            <level value="OFF" />
        </logger>
        <logger name="org.hibernate.jdbc.AbstractBatcher">
            <level value="OFF" />
        </logger>


	<!-- ======================= -->
	<!-- Setup the Root logger -->
	<!-- ======================= -->

	<root>
		<level value="INFO" />
		<appender-ref ref="CONSOLE" />
		<appender-ref ref="FILE" />
	</root>

</log4j:configuration>


