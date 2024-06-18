# Weaviate

### Overview

The Weaviate destination allows you to load and store vector embeddings in a Weaviate cluster. Weaviate is a cloud-native, vectorized data solution that enables you to store, manage, and retrieve structured data objects with associated vector embeddings.

This connector simplifies the process of integrating with a Weaviate cluster and loading your vector data into it. Once configured, you can set up Connections to extract data from various sources, generate embeddings, and seamlessly store them in your Weaviate cluster for efficient similarity searches and retrieval.

### Configuration Options

**Name**: This field represents the name you want to assign to the actor instance responsible for managing the Weaviate destination. Choose a descriptive and unique name to easily identify this instance.

**Weaviate Cluster URL**: Enter the URL of the Weaviate cluster you want to connect to. This could be a local instance or a remote cluster accessible via a URL.

**Authentication**: Select the authentication method to be used for connecting to the Weaviate cluster. The available options are:

* **NoAuthentication**: Choose this option if the Weaviate cluster does not require authentication.
* **BasicAuthentication**: Select this option if the Weaviate cluster requires basic authentication with a username and password. You will need to provide the following additional fields:
  * **Username**: Enter the username for the Weaviate cluster.
  * **Password**: Enter the password for the Weaviate cluster.
* **APIKeyAuthentication**: Choose this option if the Weaviate cluster requires authentication with an API key. You will need to provide the API key in an additional field (not shown in the screenshots).

The choice of authentication method depends on the security configuration of your Weaviate cluster. Consult the Weaviate documentation or seek guidance from your cluster administrator to determine the appropriate authentication method and credentials.

Once you've filled in the required fields, you can use the "Test and Save" button to validate the provided information and create or update the Weaviate destination in your dat configuration.
