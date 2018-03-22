FROM centos:7.4.1708

# Install jdk8 and node.js
RUN yum update -y && yum install -y \
     java-1.8.0-openjdk.x86_64 \
     java-1.8.0-openjdk-devel.x86_64

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/

CMD ["/bin/bash"]
