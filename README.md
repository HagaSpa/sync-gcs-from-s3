# sync gcs from s3
Container to synchronize gcs from s3.


# Build
```
$ docker build -t <image_id>:<tag> .
```

# Run
## Parameter
| Key | Required | Description |
|:---|:---|:---|
| CLOUDSDK_CORE_PROJECT | Y | google cloud platform project id |
| GCLOUD_SERVICE_KEY | Y | Base64 encoded string of key file of Service Account |
| AWS_ACCESS_KEY_ID | Y | aws access key id |
| AWS_SECRET_ACCESS_KEY | Y | aws secret access key |
| S3_BUCKET | Y | s3 name |
| GCS_BUCKET | Y |  google cloud storage name |

```

// cat Base64 encoded string of key file of Service 
$ cat service-account.json | base64
ABCDEFGHIJKLMN......

// build image
$ docker build -t sync_gcs_from_s3 .

// run container 
$ docker run \
    -e CLOUDSDK_CORE_PROJECT=${gcp_project_id} \
    -e GCLOUD_SERVICE_KEY=ABCDEFGHIJKLMN...... \
    -e AWS_ACCESS_KEY_ID=XXXXXXXX \
    -e AWS_SECRET_ACCESS_KEY=XXXXXXXX \
    -e S3_BUCKET=${s3_bucket_name} \
    -e GCS_BUCKET=${gcs_bucket_name} \
    sync_gcs_from_s3

Building synchronization state...
Starting synchronization...
.
.
real    0m 4.05s
user    0m 1.46s
sys     0m 0.62s

```
