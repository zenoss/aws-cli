FROM mesosphere/aws-cli
RUN apk -v --update add \
        jq \
        && \
    rm /var/cache/apk/*
COPY invalidate-n-wait.sh /usr/bin
WORKDIR /project
ENTRYPOINT []
