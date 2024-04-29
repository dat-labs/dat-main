from pytest import fixture

@fixture()
def valid_connection_object():
    yield {}

@fixture()
def valid_dat_record_message():
    yield '{"type":"STATE","log":null,"spec":null,"connectionStatus":null,"catalog":null,"record":null,"state":{"stream":{"name":"pdf","namespace":"foobarqux","json_schema":{},"read_sync_mode":"INCREMENTAL","write_sync_mode":"APPEND","cursor_field":"string","dir_uris":["bak/MySQL/STAGING/for-dat-gdrive-test"]},"stream_state":{"data":{"string":null},"stream_status":"STARTED"}}}' # TODO; fix this