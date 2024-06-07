# dat

**dat** is an open-source data integration platform. It platform enables seamless replication and transformation of data into various vector databases, making it an ideal solution for applications involving machine learning, search engines, and AI-driven analytics.

### Key Features

1. **Open Source**: Fully open-source, promoting community contributions and enabling users to tailor the platform to their specific needs.
2. **Extensive Connectors**: Provides a comprehensive library of connectors for various vector storage systems, facilitating easy data integration from multiple sources.
3. **Custom Connector Development**: Users can create and manage their own connectors, ensuring compatibility with any vector database.
4. **Automated Scheduling**: Includes robust scheduling capabilities to automate and manage recurring data replication tasks, ensuring data is always up-to-date.
5. **Monitoring and Alerting**: Offers built-in monitoring and alerting features to track the health of data pipelines and quickly address any issues that arise.

**dat** aims to simplify the integration and management of data within vector storage environments, providing a scalable and user-friendly platform for data engineers, machine learning practitioners, and developers. By leveraging our platform, users can focus on leveraging their data for advanced analytics and AI applications without worrying about the complexities of data integration.

Join us in building a powerful and flexible data integration solution for the vector storage ecosystem!

## Running locally 🚀
### First build and run
0. Ensure that you have `docker` installed.
1. Download and run
 ```bash
curl -sSL https://raw.githubusercontent.com/dat-labs/dat-main/main/run-dat-platform.sh | bash -s -- --rebuild=false
```
3. Wait for the build to complete and this message to show:
```text

     _      _     _         _ _    _                     _     _       _ 
  __| |__ _| |_  | |__ _  _(_) |__| |  __ ___ _ __  _ __| |___| |_ ___| |
 / _` / _` |  _| | '_ \ || | | / _` | / _/ _ \ '  \| '_ \ / -_)  _/ -_)_|
 \__,_\__,_|\__| |_.__/\_,_|_|_\__,_| \__\___/_|_|_| .__/_\___|\__\___(_)
                                                   |_|                   

```
4. Visit http://localhost:3000 on your browser.

> Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop dat.

### Subsequent runs
To run dat again, navigate to the `dat` dir and run `docker compose up`.
```bash
cd dat && docker compose up
```

<!-- ### Update
To update the source files to the latest revision. -->

## Contributing 🐱‍💻
### Verified Connectors
0. Clone this repo.
1. Ensure that you have `docker` installed.
2. Download and run
 ```bash
./dev-dat-platform.sh --rebuild=false
```
3. Create a virtualenv (minimum Python3.10) and activate it.
4. `pip install poetry && poetry install`
<!-- 1. Fork the [verified-*](https://github.com/dat-labs?q=verified-&type=all&language=&sort=) repo you want to contribute. -->
5. Generate stubs files for the connector you wish to develop.
```bash
python cli/main.py init
```
6. Stub files have been generated inside the `verified-*` dir. Create a virtualenv (minimum Python3.10) and activate it.

7. Install dependencies.
```bash
cd verified-source/generator/destination && pip install poetry && poetry install
```
8. Develop your `verified-*` connector and ensure tests pass.
```bash
pytest -k "your_connector"
```
9. Add your connector to local database for local integration testing.
```bash
cd /path/to/dat-main && python cli/main.py add-to-db
```
> Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop dat.

### Subsequent runs
To run dat again, navigate to the `dat-dev` dir and run `docker compose up`.
```bash
cd dat-dev && docker compose up
```

Additional resources and further instructions right up to your PR can be found at [CONTRIBUTING.md](https://github.com/dat-labs/dat-main/blob/main/CONTRIBUTING.md).