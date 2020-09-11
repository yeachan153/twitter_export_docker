# Overview
Container that scrapes twitter and exports it to specified bucket in S3.

## How to run

### Prerequisites
1. Install docker

### Process
1. `docker pull yeachan153/twitter_export_docker` (or build from Dockerfile)
2. The environment variables to supply are:
   1. AWS_ACCESS_KEY_ID (if running locally, in ECS use roles)
   2. AWS_SECRET_ACCESS_KEY (if running locally, in ECS use roles)
   3. bucket (name of export bucket)
   4. query (name of hashtag, e.g. '#amsterdam')
   5. pages (number of pages to scrape, should be an integer)
3. Run the container:

```
docker run -e AWS_ACCESS_KEY_ID=<access key> -e AWS_SECRET_ACCESS_KEY=<secret key> -e bucket=<bucket> -e query=<hashtag> -e pages=<num_pages> yeachan153/twitter_export_docker
```
3. Inside the bucket, there will be prefixes created by date in `%Y%m%d` format, and inside the file name corresponds to the `tweet_id` assinged by twitter.