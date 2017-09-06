# AWS CLI in Docker
AWS CLI docker container with a few scripts to help with ZING deployments.

## Build
```
docker build -t zenoss/aws-cli .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/zenoss/aws-cli)](https://hub.docker.com/r/zenoss/aws-cli/)

## Usage

You can use regular aws commands as follows:

```
AWS_ACCESS_KEY_ID="<id>"
AWS_SECRETY_ACCESS_KEY="<key>"
AWS_DEFAULT_REGION="<region>"

docker run --rm -t \
    -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
    -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
    -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" \
    -v "$PWD:/project" \
    zenoss/aws-cli \
    aws s3 sync /project s3://staging.zing.ninja --delete
```

There are also a few helper scripts which can be run as follows:

```
AWS_ACCESS_KEY_ID="<id>"
AWS_SECRETY_ACCESS_KEY="<key>"
AWS_DEFAULT_REGION="<region>"

docker run --rm -t \
    -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
    -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
    -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" \
    -v "$PWD:/project" \
    zenoss/aws-cli \
	invalidate-n-wait.sh S11A16G5KZMEQD "/assets/* /js/* /css/app.css"
```

## Helper Scripts

```
> invalidate-and-wait.sh --help
Usage: ./invalidate-n-wait.sh DISTRIBUTION_ID "PATHS"
Creates an invalidation for AWS Cloudfront for PATHS, and waits for completion

Example:
  ./invalidate-n-wait.sh S11A16G5KZMEQD "/assets/* /js/* /css/app.css"
```

## References
AWS CLI Docs: https://aws.amazon.com/documentation/cli/
