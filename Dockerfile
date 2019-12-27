FROM alpine

RUN apk update && \
    apk -v --update add python py-pip groff less mailcap zip mariadb-client gettext mariadb && \
    pip install --upgrade botocore && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
