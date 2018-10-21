FROM python:3-alpine

# set environment variable
#
ENV AWS_SECRET_ACCESS_KEY=Lovv9nGbGdEjYzVGjnQT2gQze3Y6bho4yqPsgU7v
ENV AWS_ACCESS_KEY_ID=AKIAJ4AC74V2FNBPS7HQ
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_DEFAULT_OUTPUT=json

# set maintenance info
#
LABEL dev.gworkx.tech.version="v1.1"
LABEL vendor="Gelwa Workx"
LABEL maintainer="gerald.luzangi@gmail.com"
LABEL dev.gworkx.tech.release-date="2018-10-20"

RUN set -x \
    && apk update && apk upgrade && apk add --no-cache build-base alpine-sdk bash \
    man-pages icu openssl-dev python-dev libffi-dev \
    && rm -rf /var/cache/apk/*

WORKDIR /app

ADD ./ ./

RUN pip install -U pip && pip install cython && pip install --no-cache-dir -r requirements.txt

EXPOSE 5005
CMD ["python","app.py"]
