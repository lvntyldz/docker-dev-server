FROM ubuntu:16.04

MAINTAINER Levent YILDIZ <dev.levent.yildiz@gmail.com>

RUN apt-get update
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install -y patch
RUN apt-get install -y wget
RUN apt-get install -y openssh-server
RUN apt-get install -y subversion apache2 libapache2-svn
RUN wget https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz   -P ~/Downloads
RUN tar zxvf ~/Downloads/apache-maven-3.6.0-bin.tar.gz  -C /usr/local

ENV  JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre/
ENV  M2_HOME /usr/local/apache-maven-3.6.0

ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$M2_HOME/bin

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD [ "sh", "-c", "service ssh start; bash"]
