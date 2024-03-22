cd src
poetry install --no-root
gcloud auth application-default login --scopes=https://www.googleapis.com/auth/bigquery,https://www.googleapis.com/auth/iam.test

echo You need to set environment variable gcp_project_id
echo Example:
echo export gcp_project_id=your_project_id