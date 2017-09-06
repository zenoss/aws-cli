FROM mesosphere/aws-cli
RUN apk -v --update add \
        jq \
        && \
    rm /var/cache/apk/*
WORKDIR /project
