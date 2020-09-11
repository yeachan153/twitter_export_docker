from twitter_scrape_fedex_case.tweets.get_tweets import TweetPipeline
from twitter_scrape_fedex_case.exporter.s3 import S3Exporter
import boto3
import os


if __name__=="__main__":
    # Get env vars
    bucket = os.getenv('bucket')
    query = os.getenv('query')
    pages = int(os.getenv('pages'))
    # Execute
    s3 = boto3.resource("s3")
    exporter = S3Exporter(s3=s3, bucket=bucket)
    pipeline = TweetPipeline(exporter)
    pipeline.execute(query=query, pages=pages)


