# OpenAI

## Overview

The OpenAI Generator connector allows you to generate embeddings or other AI-powered content using OpenAI's models. This connector integrates OpenAI's powerful language models into your data pipeline, enabling you to create vector embeddings, generate text, or perform other AI tasks as part of your data processing workflow.

## Configuration Options

**Name**: This field represents the name you want to assign to the actor instance responsible for managing the OpenAI Generator. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).

**OpenAI API Key**: Enter your OpenAI API key. This key is required to authenticate your requests to the OpenAI API. You can obtain this key from your OpenAI account dashboard. Keep this key secure and never share it publicly.

**OpenAI Model**: Specify the OpenAI model you want to use for generation tasks. The default model is 'text-embedding-ada-002', which is optimized for creating text embeddings. You can choose other models based on your specific needs, such as GPT models for text generation or DALL-E for image generation.

## Additional Information

* The default model 'text-embedding-ada-002' is suitable for creating vector embeddings of text, which can be useful for similarity searches, clustering, or other machine learning tasks.
* If you need different functionalities, such as text completion or generation, you may want to specify a different model (e.g., 'gpt-3.5-turbo' or 'gpt-4').
* Be aware of the pricing associated with different OpenAI models and the volume of requests you're making.
* Ensure that your use of the OpenAI API complies with OpenAI's use case policies and terms of service.

## Other Considerations

* Consider implementing rate limiting in your data pipeline to avoid exceeding OpenAI's API rate limits.
* Be mindful of the token limits for different models when processing large amounts of text.
* For embedding generation, consider the dimensionality of the output and ensure it's compatible with your downstream vector storage or processing steps.
* If you're using this connector for sensitive data, be aware of data privacy implications when sending text to external APIs.

Once you've filled in the required fields, you can use the "Test and Save" button to validate the provided information and create or update the OpenAI Generator connector in your dat configuration.
