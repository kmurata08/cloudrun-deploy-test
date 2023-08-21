GCP_PROJECT_ID=local-test
CAT_IMAGE_TAG=gcr.io/${GCP_PROJECT_ID}/go-api-cat
DOG_IMAGE_TAG=gcr.io/${GCP_PROJECT_ID}/go-api-dog
REGION=asia-northeast1

build:
	gcloud builds submit --config cloudbuild.yaml

deploy_cat:
	gcloud run deploy go-api-cat-service --image ${CAT_IMAGE_TAG} --platform managed --region ${REGION} --allow-unauthenticated --project ${GCP_PROJECT_ID}

deploy_dog:
	gcloud run deploy go-api-dog-service --image ${DOG_IMAGE_TAG} --platform managed --region ${REGION} --allow-unauthenticated --project ${GCP_PROJECT_ID}
