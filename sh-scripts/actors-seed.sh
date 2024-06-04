curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Foo",
  "module_name": "foo",
  "icon": null,
  "actor_type": "source",
  "status": "active"
}'