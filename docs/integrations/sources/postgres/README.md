# Postgres

## Overview

The Postgres source connector allows you to extract data from Postgres into your desired vector database.

## Prerequisites

You will need the following:

* Create a dedicated read-only Postgres user with permissions to read data from your database, and the schema you intend to use.

## Configuration Options

* **Name:** This field represents the name you want to assign to the actor instance responsible for managing the Postgres source. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).
* **Host:** Specify the host name for your Postgres which defines the location where your Postgres database is hosted. This is the IP address or hostname of the machine where Postgres is installed.
* **Port:** Specify the port number. By default, Postgres uses port number 5432, unless you have changed it during installation and configuration.&#x20;
* **Database Name:** Specify the name of the database that you want to connect with.
* **User:** Specify the Postgres user who has permissions to read data from your database, and the schema you intend to use.
* **Password:** Provide the password for the user entered above.
* **Schemas:** Provide the database schemas from where you wish to extract data.
