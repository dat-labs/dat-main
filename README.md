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
- Ensure that the Docker service (Docker desktop) is running.
1. Download and run
#### Linux/ MacOS
 ```shell
curl -sSL https://raw.githubusercontent.com/dat-labs/dat-main/main/run-dat-platform.sh | bash
```
#### Windows
```powershell
curl -o run_dat_platform.bat https://raw.githubusercontent.com/dat-labs/dat-main/main/run_dat_platform.bat; .\run_dat_platform.bat
```
3. Wait for the builds to complete pulling and this message to show:
```text

     _      _     _         _ _    _                     _     _       _ 
  __| |__ _| |_  | |__ _  _(_) |__| |  __ ___ _ __  _ __| |___| |_ ___| |
 / _` / _` |  _| | '_ \ || | | / _` | / _/ _ \ '  \| '_ \ / -_)  _/ -_)_|
 \__,_\__,_|\__| |_.__/\_,_|_|_\__,_| \__\___/_|_|_| .__/_\___|\__\___(_)
                                                   |_|                   

```
4. Visit http://localhost:3000 on your browser.

> Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop dat.

## Contributing 🐱‍💻
### Verified Connectors
0. Clone this repo.
1. Ensure that you have `docker` installed.
2. Download and run
 ```bash
./dev-dat-platform.sh --rebuild=false
```

> Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop `dat`.

### Integration
Assuming that you have built an actor and you now wish to integrate it into the locally running `dat` instance, follow these steps.
> For developing actors, please refer the detailed guide given [here](https://github.com/dat-labs/verified-generators/blob/main/DEV_GUIDE.md) for `verified-generators`.

The following steps will:


#### Steps:

1. Create a virtualenv (minimum Python3.10) and activate it.
2. Install `poetry` and install required dependencies.
```bash
pip install poetry && poetry install
```
5. Setup the repo for actor you wish to develop and/or integrate.
This will:
   - Delete the following repositories (ones which were cloned from dat-labs, if present):
      - selected `verified-*` actor directory
      - `dat-api`
      - `dat-orchestrator`
   - `git clone` your forked repository in its place (if not already cloned)
   - `git checkout` your feature branch (if provided)
   - Generate stub source files and tests (if does not exist already)
   ```bash
   python cli/main.py init
   ```
> Stub files have been generated inside the (cloned) `verified-*` dir. 

6. Create a virtualenv (minimum Python3.10) and activate it. Install dependencies.
```bash
cd verified-{actor} && pip install poetry && poetry install
```
7. Develop your `verified-*` actor and ensure tests pass. Detailed dev guides are given here: verified-sources, [verified-generators](https://github.com/dat-labs/verified-generators/blob/main/DEV_GUIDE.md), verified-destinations
   ```bash
   pytest verified_*/{your-actor}/tests/test_{your-actor}.py 
   ```

8. To add your actor to local database for local integration testing:
   - You might have added some `poetry` dependencies in your developed actor. These need to be installed in the `api` and `orchestrator` containers. This can be achieved by running.
      ```bash
      cd /path/to/dat-main/dat-dev
      docker compose build api orchestrator --no-cache
      ```
   - Once the above is done, ensure your local `dat` is running:
      ```bash
      docker compose up
      ```
   - Execute the cli command to add your actor to the local backend database.
      ```bash
      cd /path/to/dat-main
      python cli/main.py add-to-db
      ```



### Subsequent runs
To run dat again, navigate to the `dat-dev` dir and run `docker compose up`.
```bash
cd /path/to/dat-main/dat-dev
docker compose up
```

## Troubleshooting
Try looking for your issue under [BUGS](https://github.com/dat-labs/dat-main/issues?q=%5BBUG%5D). There is a good chance that someone else from the community encountered the issue and found a solution.


Additional resources and further instructions right up to your PR can be found at [CONTRIBUTING.md](https://github.com/dat-labs/dat-main/blob/main/CONTRIBUTING.md).