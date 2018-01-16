FROM ubuntu:16.04

RUN apt update
RUN apt install -y \
        build-essential \
        checkinstall \
        libreadline-gplv2-dev \
        libncursesw5-dev \
        libssl-dev \
        libsqlite3-dev \
        tk-dev \
        libgdbm-dev \
        libc6-dev \
        libbz2-dev \
        wget

# Python install

ENV PYTHON_VERSION 3.6.0

WORKDIR /root
RUN wget -O python.tar.xz https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-${PYTHON_VERSION}.tar.xz
RUN mkdir -p /usr/src/python
RUN tar -xJC /usr/src/python/ --strip-components=1 -f python.tar.xz
RUN rm -rf python.tar.xz

WORKDIR /usr/src/python
RUN ./configure --with-threads
RUN make install
RUN rm -rf /usr/src/python

RUN cd /usr/local/bin \
        && ln -s idle3 idle \
        && ln -s pydoc3 pydoc \
        && ln -s python3 python \
        && ln -s python3-config python-config



# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 9.0.1

RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py'

RUN python get-pip.py \
       --disable-pip-version-check \
       --no-cache-dir \
       "pip==$PYTHON_PIP_VERSION"
       
RUN rm -f get-pip.py

RUN cd /usr/local/bin && ln -s pip3 pip

CMD ["/bin/bash"]