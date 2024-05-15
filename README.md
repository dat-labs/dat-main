# dat-main

## Running locally 🚀
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
4. Visit http://localhost:8000 on your browser.

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
6. Develop your `verified-*` connector.
7. Add your connector to local database for local integration testing.
```bash
python cli/main.py add-to-db
```
> When restarting services for subsequent sessions, you can just do a `docker compose up` inside `./dat-dev`.

Additional resources and further instructions right up to your PR can be found at [CONTRIBUTING.md](https://github.com/dat-labs/dat-main/blob/main/CONTRIBUTING.md).