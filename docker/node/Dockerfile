FROM centos:7.4.1708

# Install Node.js
RUN yum update -y && yum install -y \
        gcc-c++ \
        make \
        && curl -sL https://rpm.nodesource.com/setup_8.x | bash - \
        && yum install -y nodejs

CMD ["/bin/bash"]
