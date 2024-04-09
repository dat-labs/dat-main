import re
import os
import click
import requests


def validate_actor_name(ctx, param, value):
    if not re.match(r'^[a-zA-Z][a-zA-Z0-9]*$', value):
        raise click.BadParameter(
            'Actor name must start with a letter, and only contain alphanumeric characters.')
    if len(value) > 255:
        raise click.BadParameter(
            'Actor name must be maximum 255 characters long.')
    return value


def validate_module_name(ctx, param, value):
    if not re.match(r'^[a-zA-Z][a-zA-Z0-9_]*$', value):
        raise click.BadParameter(
            'Module name must start with a letter, and only contain alphanumeric characters and underscores.')
    if len(value) > 255:
        raise click.BadParameter(
            'Module name must be maximum 255 characters long.')
    return value


def create_module_dir(module_name):
    # Create directory with module name
    os.makedirs(os.path.join('verified_sources', module_name), exist_ok=True)

    # Define URL to fetch content from
    url_map = {
        'catalog': 'https://raw.githubusercontent.com/dat-labs/dat-core/main/dat_core/specs/DatCatalog.yml',
        'specs': 'https://raw.githubusercontent.com/dat-labs/dat-core/main/dat_core/specs/ConnectorSpecification.yml',
    }

    for filename, url in url_map.items():
        # Fetch content from the URL
        response = requests.get(url)
        if not response.status_code == 200:
            print("Failed to fetch content from URL")
            continue
        # Write content to filename file inside the module directory
        with open(os.path.join('verified_sources', module_name, f'{filename}.yml'), 'w') as file:
            file.write(response.text)
        print(f"File '{filename}.yml' created in directory '{module_name}'")


def create_actor_file(module_name, actor_name):
    # Create directory if it doesn't exist
    # os.makedirs('dat_core/connectors/sources', exist_ok=True)

    # Define the file path
    file_path = os.path.join('verified_sources', module_name, 'source.py')

    # Create the Python file with the actor class
    with open(file_path, 'w') as file:
        file.write(f"from dat_core.connectors.sources.base import SourceBase\n\n")
        file.write(f"class {actor_name}(SourceBase):\n")
        file.write(f"    def check_connection(self):\n")
        file.write(f"        # Implement your connection check logic here\n")
        file.write(f"        pass\n")

    print(
        f"Python file '{module_name}.py' created with class '{actor_name}' inheriting from 'SourceBase'")


@click.command()
@click.option('--actor-name', prompt='Enter actor name', callback=validate_actor_name,
              help='Name of the actor (alphanumeric, first character cannot be a number, max 255 characters)')
@click.option('--module-name', prompt='Enter module name', callback=validate_module_name,
              help='Name of the module (alphanumeric, first character cannot be a number, max 255 characters)')
# @click.option('--actor-type', type=click.Choice(['source', 'generator', 'destination']),
#               prompt='Enter actor type',
#               help='Type of the actor (source, generator, destination)')
def main(
        actor_name,
        module_name,
        #  actor_type,
):
    click.echo(f'Entered actor name: {actor_name}')
    # click.echo(f'Entered actor type: {actor_type}')
    create_module_dir(module_name)
    create_actor_file(module_name, actor_name)


if __name__ == '__main__':
    main()
