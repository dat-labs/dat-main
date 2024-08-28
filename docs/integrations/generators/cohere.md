# Cohere

## Overview

The Cohere Generator allows you to generate embeddings using Cohere’s models. This connector integrates Cohere's powerful embedding models into your data pipeline, enabling you to create vector embeddings as part of your data processing workflow.

## Configuration Options

**Name**:  This field represents the name you want to assign to the actor instance responsible for managing the Cohere Generator. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).

**Cohere API Key:** Enter your Cohere API key. This key is required to authenticate your requests to the Cohere API. You can obtain this key from your Cohere account dashboard. Keep this key secure and never share it publicly. Read more about API keys [here](https://docs.cohere.com/v1/docs/rate-limits).

**Cohere Model:** Specify the Cohere model you want to use for generation tasks. The default model is \`embed-english-v3.0\`, which is optimized for creating text embeddings. You can choose other models based on your specific needs. Available models (and corresponding embedding dimensions) are as under:

* embed-english-v3.0 (1024 dimensions)
* embed-multilingual-v3.0 (1024 dimensions)
* embed-english-light-v3.0 (384 dimensions)
* embed-multilingual-light-v3.0 (384 dimensions)
* embed-english-v2.0 (4096 dimensions)
* embed-english-light-v2.0 (1024 dimensions)
* embed-multilingual-v2.0 (768 dimensions)

## Additional Information

* The default model \`embed-english-v3.0’ is suitable for English text to be classified or turned into embeddings., which can be useful for similarity searches, clustering, or other machine learning tasks.
* If you need different functionalities, such as multilingual classification and embedding support, you may want to specify a different model (e.g. embed-multilingual-v3.0).  You can read about the different models [here](https://docs.cohere.com/docs/models#embed)
* Be aware of the pricing associated with different Cohere models and the volume of requests you're making.
* Ensure that your use of the Cohere API complies with Cohere's use case policies and terms of service.

## Other Considerations

* Consider implementing rate limiting in your data pipeline to avoid exceeding Cohere's API rate limits. Read more about rate limits [here](https://docs.cohere.com/v1/docs/rate-limits).
* Be mindful of the token limits for different models when processing large amounts of text.
* For embedding generation, consider the dimensionality of the output and ensure it's compatible with your downstream vector storage or processing steps.
* If you're using this connector for sensitive data, be aware of data privacy implications when sending text to external APIs.
