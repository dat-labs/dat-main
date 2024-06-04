curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "GoogleDrive",
  "module_name": "google_drive",
  "icon": null,
  "actor_type": "source",
  "status": "active"
}'

curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "WebsiteCrawler",
  "module_name": "website_crawler",
  "icon": null,
  "actor_type": "source",
  "status": "active"
}'

curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "OpenAI",
  "module_name": "openai",
  "icon": null,
  "actor_type": "generator",
  "status": "active"
}'

curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Pinecone",
  "module_name": "pinecone",
  "icon": null,
  "actor_type": "destination",
  "status": "active"
}'

curl -X 'POST' \
  'http://localhost:8000/actors' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Qdrant",
  "module_name": "qdrant",
  "icon": null,
  "actor_type": "destination",
  "status": "active"
}'

