# dat-main

## Running locally
0. Ensure that you have `docker` installed.
1. Clone this repo and `cd` into it.
 ```bash
# clone dat from GitHub
git clone --depth=1 https://github.com/dat-labs/dat-main.git

# switch into dat-main directory
cd dat-main
```
2. Run the executable which will clone additional repos and setup docker containers.
```bash
# start dat
./run-dat-platform.sh
```

## Contributing
1. Fork the [verified-*](https://github.com/dat-labs?q=verified-&type=all&language=&sort=) repo you want to contribute.
2. `cd verified-*`
3. Create a virtualenv (minimum Python3.10) and activate it.
4. `pip install poetry`
5. `poetry install`
6. `curl -O  https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli.py`
7. `python verified_stub_generator_cli.py`

Additional resources can be found at [CONTRIBUTING.md](https://github.com/path/to/CONTRIBUTING.md).