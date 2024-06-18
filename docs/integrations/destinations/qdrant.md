# Qdrant

### Overview

The Qdrant destination allows you to load and store vector embeddings in a Qdrant vector database. Qdrant is a high-performance vector similarity search engine designed to handle large collections of dense vector embeddings efficiently.

This connector simplifies the process of integrating with a Qdrant server and creating or updating collections to store your vector data. Once configured, you can set up Connections to extract data from various sources, generate embeddings, and seamlessly load them into your Qdrant collections for fast similarity searches and retrieval.

### Configuration Options

**Qdrant URL**: Enter the URL of the Qdrant server you want to connect to. This could be a local instance or a remote server accessible via a URL.

**Collection name**: Specify the name of the collection within the Qdrant database where you want to store your vector embeddings. If the collection doesn't exist, the connector will create a new one with the provided name.

**Distance Function**: Select the distance function to be used for vector similarity calculations within the Qdrant collection. The available options are:

* **Cos**: Cosine similarity, which measures the cosine of the angle between two vectors. This is a common choice for dense, normalized vectors.
* **Euc**: Euclidean distance, which calculates the straight-line distance between two points in the vector space. Useful for vectors that are not normalized.
* **Dot**: Dot product, which measures the scalar product of two vectors. This can be suitable for certain types of embeddings and applications.

The choice of distance function depends on the characteristics of your vector embeddings and the specific requirements of your use case. Consult the Qdrant documentation or seek guidance from domain experts to select the most appropriate function.

Once you've filled in the required fields, you can use the "Test and Save" button to validate the provided information and create or update the Qdrant destination in your dat configuration.
