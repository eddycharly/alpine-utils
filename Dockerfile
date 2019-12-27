FROM alpine

RUN apk update && \
    apk -v --update add python py-pip groff less mailcap zip gettext mariadb mariadb-client && \
    pip install --upgrade botocore && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

WORKDIR /work
