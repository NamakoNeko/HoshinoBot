FROM python:3-slim-buster
WORKDIR /workdir
ADD . .
#更换APT源为阿里云 境外服务器请注释掉
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian-security buster/updates main" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y apt-utils libterm-readkey-perl
RUN apt-get install -y libxml2-dev libxslt-dev python-dev gfortran libopenblas-dev liblapack-dev libatlas-base-dev libblas-dev libjpeg-dev zlib1g-dev build-essential libxft-dev libpng-dev
#更换PIP源为阿里云 境外服务器请注释掉
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN /usr/local/bin/python3.9 -m pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install Cython
RUN pip install -r requirements.txt
ENTRYPOINT [ "python", "run.py"]
