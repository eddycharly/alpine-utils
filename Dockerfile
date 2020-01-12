FROM alpine

RUN apk update && \
    apk -v --update add curl python py-pip groff less mailcap zip gettext mariadb mariadb-client && \
    pip install --upgrade botocore && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl -L https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

WORKDIR /work
