#!/bin/bash

# create secret.json
echo $GCLOUD_SERVICE_KEY | base64 -d > key.json

# activate service account
gcloud auth activate-service-account --key-file=key.json

# sync s3 to gcs
gsutil -m rsync -r s3://$S3_BUCKET gs://$GCS_BUCKET
