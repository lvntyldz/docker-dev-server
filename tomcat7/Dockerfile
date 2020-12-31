# Pull base image.
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install unzip -y
RUN apt-get install vim -y
RUN apt-get install -y wget
RUN apt-get install -y openssh-server

RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.47/bin/apache-tomcat-7.0.47.zip   -P ~/Downloads
RUN unzip ~/Downloads/apache-tomcat-7.0.47.zip   -d /usr/local

RUN wget http://archive.apache.org/dist/axis/axis2/java/core/1.6.2/axis2-1.6.2-war.zip   -P ~/Downloads
RUN unzip ~/Downloads/axis2-1.6.2-war.zip   -d  /usr/local
RUN scp  /usr/local/axis2.war   /usr/local/apache-tomcat-7.0.47/webapps/
RUN chmod -R 0777 /usr/local/apache-tomcat-7.0.47/bin/

COPY ./tomcat-users.xml /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml

#COPY ./CustomerService.aar /usr/local/apache-tomcat-7.0.47/webapps/axis2/WEB-INF/services/

# Install Java.
RUN apt-get install -y openjdk-6-jdk 

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

EXPOSE 8080

# Define default command.
CMD ["bash"]

#docker run -it   -p 8080:8080 jdk6  /bin/bash