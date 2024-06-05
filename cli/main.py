import re
import os
import click
import requests

actor_types = ['source', 'generator', 'destination']
base_template_url = 'https://raw.githubusercontent.com/dat-labs/dat-main/main'
# base_template_url = 'http://localhost:8000'    # local testing
api_url = 'http://localhost:8000'
base_dev_dir = 'dat-dev'

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
    os.makedirs(os.path.join(
        base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'tests'), exist_ok=True)


def create_files_from_template(module_name, actor_name, actor_type):
    # Define the file path
    paths_templates = [
        # yml
        (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'specs.yml'),
         f'{base_template_url}/cli/templates/specs.yml.txt'),

        # py
        (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'specs.py'),
         f'{base_template_url}/cli/templates/specs.py.txt'),
        (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, f'{actor_type}.py'),
         f'{base_template_url}/cli/templates/{actor_type}.py.txt'),

        # tests
        (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'tests', 'conftest.py'),
         f'{base_template_url}/cli/templates/tests/{actor_type}/conftest.py.txt'),
        (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'tests', f'test_{module_name}.py'),
         f'{base_template_url}/cli/templates/tests/{actor_type}/test_.py.txt'),
    ]
    additional_path_templates = {
        'source': [
            # yml
            (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'catalog.yml'),
             f'{base_template_url}/cli/templates/catalog.yml.txt'),

            # py
            (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'catalog.py'),
             f'{base_template_url}/cli/templates/catalog.py.txt'),
            (os.path.join(base_dev_dir, f'verified-{actor_type}s', f'verified_{actor_type}s', module_name, 'streams.py'),
             f'{base_template_url}/cli/templates/streams.py.txt'),
        ],
    }
    replacements = [
        ('<actor_name>', actor_name),
        ('<module_name>', module_name),
        ('<actor_type>', actor_type),
    ]
    paths_templates += additional_path_templates.get(actor_type, [])

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


@click.group()
def cli():
    '''Entry point'''


@cli.command()
@click.option('--actor-type', type=click.Choice(actor_types),
              prompt='Enter actor type', help='Type of the actor ({})'.format(', '.join(actor_types)))
@click.option('--actor-name', prompt='Enter actor name', callback=validate_actor_name,
              help='Name of the actor (alphanumeric, first character cannot be a number, max 255 characters)')
@click.option('--module-name', prompt='Enter module name', callback=validate_module_name,
              default=lambda: camel_to_snake(
                  click.get_current_context().params.get("actor_name", None)),
              help='Name of the module (alphanumeric, first character cannot be a number, max 255 characters)')
def init(actor_type, actor_name, module_name, ):
    click.echo(f'Entered actor name: {actor_name}')
    click.echo(f'Entered actor type: {actor_type}')
    create_module_dir(module_name, actor_type)
    create_files_from_template(module_name, actor_name, actor_type)


@cli.command()
@click.option('--actor-type', type=click.Choice(actor_types),
              prompt='Enter actor type', help='Type of the actor ({})'.format(', '.join(actor_types)))
@click.option('--actor-name', prompt='Enter actor name', callback=validate_actor_name,
              help='Name of the actor (alphanumeric, first character cannot be a number, max 255 characters)')
@click.option('--module-name', prompt='Enter module name', callback=validate_module_name,
              default=lambda: camel_to_snake(
                  click.get_current_context().params.get("actor_name", None)),
              help='Name of the module (alphanumeric, first character cannot be a number, max 255 characters)')
def add_to_db(actor_type, actor_name, module_name, ):
    import dat_client
    from dat_client.rest import ApiException
    from dat_client.configuration import Configuration
    from dat_client.models.actor_post_request import ActorPostRequest
    configuration = Configuration(
        host=api_url,
        # verify_ssl=False,
    )
    with dat_client.ApiClient(configuration) as api_client:
        actors_api_instance = dat_client.ActorsApi(api_client)
        try:
            api_response = actors_api_instance.create_actor_actors_post(
                actor_post_request=ActorPostRequest(
                    name=actor_name,
                    module_name=module_name,
                    actor_type=actor_type,
                    icon=f'{module_name}.svg',
                )
            )
            print(
                "The response of ActorsApi->create_actor_actors_post:\n")
            print(api_response)
        except ApiException as e:
            print(
                "Exception when calling ActorsApi->create_actor_actors_post: %s\n" % e)


if __name__ == '__main__':
    cli()
