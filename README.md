# dat-main

## Running locally 🚀
0. Ensure that you have `docker` installed.
1. Download and run
 ```bash
curl -sSL https://raw.githubusercontent.com/dat-labs/dat-main/main/run-dat-platform.sh | bash -s -- --rebuild=false
```
3. Visit http://localhost:8000 on your browser once all connectors have come up. (TODO: how will people know this?)

## Contributing 🐱‍💻
### Verified Connectors
1. Fork the [verified-*](https://github.com/dat-labs?q=verified-&type=all&language=&sort=) repo you want to contribute.
2. `cd verified-*`
3. Create a virtualenv (minimum Python3.10) and activate it.
4. `pip install poetry`
5. `poetry install`
6. `curl -O  https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli.py`
7. `python verified_stub_generator_cli.py`

Additional resources and further instructions right up to your PR can be found at [CONTRIBUTING.md](https://github.com/path/to/CONTRIBUTING.md).