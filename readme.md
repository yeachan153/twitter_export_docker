# Overview
Container that scrapes twitter and exports it to specified bucket in S3.

## How to run

### Prerequisites
1. Install docker

### Process
1. The environment variables to supply are:
   1. AWS_ACCESS_KEY_ID (if running locally, in ECS use roles)
   2. AWS_SECRET_ACCESS_KEY (if running locally, in ECS use roles)
   3. bucket (name of export bucket)
   4. query (name of hashtag, e.g. '#amsterdam')
   5. pages (number of pages to scrape, should be an integer)
2. Run the container:

```
docker run -e AWS_ACCESS_KEY_ID=<access key> -e AWS_SECRET_ACCESS_KEY=<secret key> -e bucket=<bucket> -e query=<hashtag> -e pages=<num_pages> ubuntu_python
```
3. Inside the bucket, there will be prefixes created by date in `%Y%m%d` format, and inside the file name corresponds to the `tweet_id` assinged by twitter.