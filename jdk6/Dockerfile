# Pull base image.
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install git -y
RUN apt-get install npm -y
RUN apt-get install -y patch
RUN apt-get install -y wget
RUN apt-get install -y openssh-server
RUN apt-get install -y subversion apache2 libapache2-svn
RUN wget https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz   -P ~/Downloads
RUN tar zxvf ~/Downloads/apache-maven-3.6.0-bin.tar.gz  -C /usr/local

# Install Java.
RUN apt-get install -y openjdk-6-jdk && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64
ENV  M2_HOME /usr/local/apache-maven-3.6.0

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Define default command.
CMD ["bash"]