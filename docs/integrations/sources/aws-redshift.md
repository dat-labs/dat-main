---
description: This source connects to AWS Redshift
---

# AWS Redshift

## Overview

The AWS Redshift source connector allows you to extract data from your AWS Redshift into your desired vector database.

## Prerequisites

You will need the following:

* Create a new user with rights/permissions to access the resources in your AWS account

## Configuration Options

* **Name:** This field represents the name you want to assign to the actor instance responsible for managing the AWS Redshift source. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).
* **Host:** Specify the host name for your AWS Redshift.
* **Port:** Specify the port number. By default, AWS Redshift uses port number 5439, unless you have changed it during installation and configuration.&#x20;
* **Database Name:** Specify the name of the database that you want to connect with.
* **User:** Specify the AWS Redshift user who has permissions to read data from your AWS Redshift.
* **Password:** Provide the password for the user entered above.
* **Schemas:** Provide the database schemas from where you wish to extract data.

\
