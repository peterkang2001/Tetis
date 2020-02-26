FROM python:3.7.6-alpine3.10

MAINTAINER peterkang2001@gmail.com
USER root
ENV TIME_ZONE Asia/Shanghai

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories \
    && apk add --no-cache -U tzdata \
    && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime \
    && echo "${TIME_ZONE}" > /etc/timezone \
    && pip install django==2.2.10 -i http://mirrors.aliyun.com/pypi/simple/  --trusted-host mirrors.aliyun.com \
    && mkdir /app \
    && mkdir /logs

ADD . /app
WORKDIR /app
EXPOSE 8000
#CMD ["/bin/sh"]
CMD ["./manage.py", "runserver"]