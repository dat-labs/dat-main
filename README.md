# dat-main

## Running locally
0. Ensure that you have `docker` installed.
1. Clone this repo and `cd` into it.
 ```bash
# clone dat from GitHub
git clone --depth=1 https://github.com/dat-labs/dat-core.git

# switch into dat directory
cd dat-core
```
2. Run the executable which will clone additional repos and setup docker containers.
```bash
# start dat
./run-dat-platform.sh
```

## Contributing
1. Fork the verified-* repo you want to contribute.
2. `cd verified-*`
3. Create a virtualenv (minimum Python3.10) and activate it.
4. `pip install poetry`
5. `poetry install`
6. `curl -O  https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli.py`
7. `python verified_stub_generator_cli.py`

