#! /bin/sh

if [ "$#" -eq 0 -o "$1" = "--help" -o "$1" = "--help" ]; then
    echo "Usage: $0 DISTRIBUTION_ID PATHS"
    echo "Creates an invalidation for AWS Cloudfront for PATHS, and waits for completion"
    echo ""
    echo "Example:"
    echo "  $0 S11A16G5KZMEQD \"/assets/* /js/* /css/app.css\""
    exit 0
fi

DISTRIBUTION_ID=$1
PATHS="$2"

if [ -z "$PATHS" ]; then
    echo "at least one invalidation path must be provided"
    exit 1
fi

# as of aws-cli 1.11.13, cloudfront api is preview only
aws configure set preview.cloudfront true

echo "creating invalidation for the following paths:"
echo "    $PATHS"
INVALIDATION_JSON=$(aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "$PATHS")
if [ $? -ne 0 ]; then
    echo "There was a problem creating the invalidation"
    exit $?
fi

INVALIDATION_ID=$(echo $INVALIDATION_JSON | jq -r ".Invalidation.Id")

echo "Waiting on invalidation $INVALIDATION_ID"
aws cloudfront wait invalidation-completed --distribution-id E1WOYNJG1U75EN --id $INVALIDATION_ID
if [ $? -ne 0 ]; then
    echo "There was a problem completing the invalidation"
    exit $?
fi

echo "Invalidation complete"
