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


def create_module_dir(module_name, actor_type):
    # Create directory with module name
    os.makedirs(os.path.join(f'verified_{actor_type}s', module_name, 'tests'), exist_ok=True)


def create_files_from_template(module_name, actor_name, actor_type):
    # Define the file path
    paths_templates = [
        # yml
        (os.path.join(f'verified_{actor_type}s', module_name, 'specs.yml'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/specs.yml.txt'),
        (os.path.join(f'verified_{actor_type}s', module_name, 'catalog.yml'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/catalog.yml.txt'),
        # py
        (os.path.join(f'verified_{actor_type}s', module_name, 'specs.py'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/specs.py.txt'),
        (os.path.join(f'verified_{actor_type}s', module_name, 'catalog.py'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/catalog.py.txt'),
        (os.path.join(f'verified_{actor_type}s', module_name, 'source.py'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/source.py.txt'),
        # tests
        (os.path.join(f'verified_{actor_type}s', module_name, 'tests', 'conftest.py'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/tests/conftest.py.txt'),
        (os.path.join(f'verified_{actor_type}s', module_name, 'tests', f'test_{module_name}.py'), 'https://raw.githubusercontent.com/dat-labs/dat-main/main/verified_stub_generator_cli/templates/tests/test_.py.txt'),
    ]
    replacements = [
        ('<actor_name>', actor_name),
        ('<module_name>', module_name),
    ]
    for path_template in paths_templates:
        file_path = path_template[0]
        template_url = path_template[1]
        # Fetch the template contents from the HTTP URL
        response = requests.get(template_url)
        if response.status_code != 200:
            _err = f"Failed to fetch template content from URL: {template_url}"
            raise Exception(_err)
        
        template_contents = response.text
        # Replace placeholders in the template contents
        for _r in replacements:
            template_contents = template_contents.replace(_r[0], _r[1])

        # Write the modified contents to the new file
        with open(file_path, 'w') as file:
            file.write(template_contents)

        print(f'{file_path} written.')
            
def camel_to_snake(camelcase_str):
    return re.sub(r'(?<!^)(?=[A-Z])', '_', camelcase_str).lower()

@click.command()
@click.option('--actor-type', type=click.Choice(['source', 'generator', 'destination']),
              prompt='Enter actor type', help='Type of the actor (source, generator, destination)')
@click.option('--actor-name', prompt='Enter actor name', callback=validate_actor_name,
              help='Name of the actor (alphanumeric, first character cannot be a number, max 255 characters)')
@click.option('--module-name', prompt='Enter module name', callback=validate_module_name,
              default=lambda: camel_to_snake(click.get_current_context().params.get("actor_name", None)),
              help='Name of the module (alphanumeric, first character cannot be a number, max 255 characters)')
def main(actor_type, actor_name, module_name, ):
    click.echo(f'Entered actor name: {actor_name}')
    click.echo(f'Entered actor type: {actor_type}')
    create_module_dir(module_name, actor_type)
    create_files_from_template(module_name, actor_name, actor_type)


if __name__ == '__main__':
    main()
