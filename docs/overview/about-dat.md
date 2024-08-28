# About dat

### What is dat (data activation tool)?

Moving generative AI applications to production often requires using Vector stores to provide them with relevant context. Keeping these vector stores up-to-date with changes in your data is critical for the continued performance of these applications. dat makes this possible by setting up pipelines to update your vector stores as your source data changes.

![About Dat](../images/about-dat.gif)

dat is an open source ETL platform that:

* Ingests diverse data from a variety of sources i.e. unstructured data (such as text files/ emails/ social media posts etc.), semi-structured data (XML, JSON etc) as well as structured data (spreadsheets/ tables etc.).&#x20;
* Uses pre-existing models to create embeddings.
* Stores the embeddings in a vector database.&#x20;

\
This involves processing the input text documents by using a generator to convert them into vector embeddings and storing these embeddings and their metadata in the specified vector database.  This is an important prerequisite for leveraging Large Language Models(LLMs) in delivering a variety of use cases from semantic search to conversational user interfaces such as chatbots.
