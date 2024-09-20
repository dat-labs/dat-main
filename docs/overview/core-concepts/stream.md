# Stream

A stream represents a collection of related records. The term "stream" is used to generalize the flow of data across different types of destinations, which might be referred to as a table, file, or blob depending on the context.

#### Examples of streams include:

* A table in a relational database
* An API endpoint in a REST API
* Files within a directory in a filesystem

### Stream Configuration

#### 1. **Namespace**

* **Description**: Defines the logical grouping (or database schema) that the data belongs to, helping to organize different streams of data in various environments or databases.

#### 2. **ReadSyncMode**

* **Description**: Determines how data is read from the source.
* **Options**:
  * **INCREMENTAL**: Reads only new or updated records since the last sync, optimizing performance by reducing data transfer.
  * **FULL\_REFRESH**: Reads all the data from the source, regardless of previous synchronization.

#### 3. **WriteSyncMode**

* **Description**: Specifies how data is written to the destination.
* **Options**:
  * **REPLACE**: Replaces all existing data at the destination with the new data.
  * **APPEND**: Adds new data to the destination without overwriting existing data.
  * **UPSERT**: Inserts new records and updates existing records if they already exist at the destination. This is useful for ensuring that the destination data remains up to date without removing existing records.

#### 4. **Advanced Settings**

* This section provides more granular controls for data processing, specifically for handling unstructured or structured data with various splitting techniques.

**Splitter Settings**

* **Description**: These settings determine how the incoming data stream is split or parsed into manageable parts, depending on the structure of the data.
* **Options**:
  * **SplitByHtmlHeaderSettings**: Splits the data based on HTML headers like `<h1>`, `<h2>`, etc. This is useful for parsing and tracking sections of HTML content.
  * **SplitByCharacterSettings**: Splits the data stream based on character count, allowing for even division based on text length.
  * **SplitCodeSettings**: Splits data based on code blocks, useful when the data contains programming code or structured snippets.
  * **SplitByMarkdownSettings**: Splits the data based on Markdown headings and syntax, suitable for parsing markdown documents.
  * **SplitJsonRecursivelySettings**: Recursively splits JSON data into smaller parts, useful for handling deeply nested JSON objects.
  * **SplitByCharacterRecursivelySettings**: Recursively splits data by character length, useful for splitting large text chunks.
  * **SplitByTokensSettings**: Splits the data based on specific tokens, which can be predefined symbols or keywords within the data stream.

