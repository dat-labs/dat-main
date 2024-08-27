# Destination

The destination is the place where the transformed data is loaded after extraction and transformation.   For loading high dimensional vector embeddings we require vector databases as the final destinations.  Some examples of vector databases are Pinecone, Weaviate, Qdrant, Milvus etc.&#x20;

The destination is a crucial element of the data ETL process as it marks the final stage where the data, after going through various stages of cleaning and conversion to embeddings, is deposited for use in analytics or other business processes. Ensuring that the data is correctly loaded into the destination system is vital for maintaining data integrity and enabling accurate insights.&#x20;

When choosing an  appropriate destination you must bear in mind  the performance, scalability, compatibility with existing tools and software, cost etc.&#x20;

For example, if moving data from a Postgres database,  into a Qdrant vector database,  then Qdrant is the destination.
