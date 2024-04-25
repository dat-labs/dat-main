from pytest import fixture

@fixture()
def valid_connection_object():
    yield {}

@fixture()
def valid_catalog_object():
    yield {'document_streams': []}