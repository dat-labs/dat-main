# Amazon S3

## Overview

The Amazon S3 source connector allows you to extract data from AWS S3 Buckets into your desired vector database.

## Prerequisites

You will need the following AWS permissions:

* `ListBuckets` - Returns a list of all buckets owned by the authenticated sender of the request.
* `ListObjectsV2` - Returns some or all (up to 1,000) of the objects in a bucket.
* `GetObject` - Retrieves an object from Amazon S3.

## Configuration Options

* **Name:** This field represents the name you want to assign to the actor instance responsible for managing the Amazon S3 source. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).
* **AWS Access Key:** Specify your AWS access key for authentication. You can obtain your AWS access key and secret key from the AWS Management Console in the security credentials section of your IAM user.
* **AWS Secret Key:** Specify your AWS secret key for authentication. You can obtain your AWS access key and secret key from the AWS Management Console in the security credentials section of your IAM user.
* **Bucket Name:** Specify the AWS S3 Bucket Name from where you wish to extract data.
* **Region Name:** Specify the AWS region where the AWS S3 Bucket resides.

### Supported streams

The following streams are supported for this source:

* TXT
* PDF
