---
title: Google Drive
source_type: File
description: This source connects to Google Drive
certification_status: certified
tags: ["verified"]
---

# Google Drive

## Overview

The Google Drive source connector allows you to extract files and data from Google Drive. This connector simplifies the process of integrating with Google Drive, enabling you to access, read, and download files as part of your data pipeline.

## Configuration Options

**Name**: This field represents the name you want to assign to the actor instance responsible for managing the Google Drive source. Choose a descriptive and unique name to easily identify this instance within your data activation tool (dat).

**Client ID**: Enter the Client ID associated with your Google Cloud project. This ID is part of the OAuth 2.0 credentials used to authenticate your application with Google Drive API. You can obtain this from the Google Cloud Console under the "Credentials" section.

**Client Secret**: Provide the Client Secret that corresponds to your Client ID. This is the other half of your OAuth 2.0 credentials and should be kept secure. Never share this secret publicly or include it in version control systems.

**Refresh Token**: Enter the Refresh Token for your Google Drive integration. This long-lived token allows your application to obtain new access tokens without requiring user intervention. You'll need to go through the OAuth 2.0 flow once to obtain this refresh token.

## Additional Information

* To use this connector, you need to set up a project in the Google Cloud Console and enable the Google Drive API.
* Ensure that you have the necessary permissions to access the target Google Drive account and read the required files.
* The refresh token doesn't expire, but it can be revoked. If you encounter authentication issues, you may need to generate a new refresh token.
* Be cautious with these credentials, as they provide access to the connected Google Drive account. Implement proper security measures to protect this sensitive information.

## Other Considerations

* You may need to specify which files or folders to access within your data pipeline configuration.
* Consider how you'll handle different file types and data formats when extracting from Google Drive.
* Be mindful of rate limits and quotas imposed by the Google Drive API to ensure smooth operation of your data pipelines.

Once you've filled in the required fields, you can use the "Test and Save" button to validate the provided information and create or update the Google Drive source in your dat configuration.
