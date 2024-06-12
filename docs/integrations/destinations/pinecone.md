# Pinecone

## Overview
This page guides you through the process of setting up the Pinecone destination connector.

There are three parts to this:

- Processing - split up individual records in chunks so they will fit the context window and decide which fields to use as context and which are supplementary metadata.
- Embedding - convert the text into a vector representation using a pre-trained model (Currently, OpenAI's text-embedding-ada-002 and Cohere's embed-english-light-v2.0 are supported.)
- Indexing - store the vectors in a vector database for similarity search

## Prerequisites
To use the Pinecone destination, you'll need:

- An account with API access for OpenAI or Cohere (depending on which embedding method you want to use)
- A Pinecone project with a pre-created index with the correct dimensionality based on your embedding method
You'll need the following information to configure the destination:

- Embedding service API Key - The API key for your OpenAI or Cohere account
- Pinecone API Key - The API key for your Pinecone account
- Pinecone Environment - The name of the Pinecone environment to use
- Pinecone Index name - The name of the Pinecone index to load data into

## Features

| Name     | Embedding | Gen  | Add | Sub |
|----------|-----------|------|-----|-----|
| Pine     | open      | open | som | sub |
| Qdrant   | open      | open | val | 2   |
| Weaviate | open      | open | 2   | arb |
