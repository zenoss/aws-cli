FROM mesosphere/aws-cli
RUN apk -v --update add \
        jq \
        && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
