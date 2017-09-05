# AWS CLI in Docker
AWS CLI docker container with a few scripts to help with ZING deployments.

## Build

```
docker build -t zenoss/aws-cli .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/zenoss/aws-cli)](https://hub.docker.com/r/zenoss/aws-cli/)

## Usage

```
AWS_ACCESS_KEY_ID="<id>"
AWS_SECRETY_ACCESS_KEY="<key>"
AWS_DEFAULT_REGION="<region>"

docker run --rm -t \
    -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
    -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
    -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" \
    -v "$PWD:/project" \
    mesosphere/aws-cli \
    s3 sync /project s3://staging.zing.ninja --delete &>/dev/null \
```

## References

AWS CLI Docs: https://aws.amazon.com/documentation/cli/
