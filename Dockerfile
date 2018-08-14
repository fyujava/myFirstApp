FROM centos:latest
MAINTAINER  fangyu "fyujava@126.com"
RUN mkdir /web1/
RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install unzip

WORKDIR /web1/

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
RUN tar -xvf jdk-8u181-linux-x64.tar.gz
RUN rm -rf /web/jdk-8u181-linux-x64.tar.gz

RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
RUN tar zxvf apache-maven-3.5.4-bin.tar.gz
RUN rm -rf /web/apache-maven-3.5.4-bin.tar.gz


RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.90/bin/apache-tomcat-7.0.90.tar.gz
RUN tar zxvf apache-tomcat-7.0.90.tar.gz
RUN rm -rf /web/apache-tomcat-7.0.90.tar.gz


ENV JAVA_HOME /web1/jdk1.8.0_181
ENV JRE_HOME $JAVA_HOME/jre
ENV M2_HOME /web1/apache-maven-3.5.4
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin
ENV CATALINA_HOME /web1/apache-tomcat-7.0.90

EXPOSE 8080
ENTRYPOINT ["/web1/apache-tomcat-7.0.90/bin/catalina.sh", "run"]
