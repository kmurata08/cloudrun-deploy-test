GCP_PROJECT_ID=local-test
COMMIT_REF=$(shell git rev-parse --short HEAD)
CAT_IMAGE_TAG=gcr.io/${GCP_PROJECT_ID}/go-api-cat:development-${COMMIT_REF}
DOG_IMAGE_TAG=gcr.io/${GCP_PROJECT_ID}/go-api-dog:development-${COMMIT_REF}
REGION=asia-northeast1

build:
	gcloud builds submit --config cloudbuild.yaml --substitutions=_ENV_NAME=development,_VERSION=${COMMIT_REF}

deploy_cat:
	gcloud run deploy go-api-cat-service --image ${CAT_IMAGE_TAG} --platform managed --region ${REGION} --allow-unauthenticated --project ${GCP_PROJECT_ID}

deploy_dog:
	gcloud run deploy go-api-dog-service --image ${DOG_IMAGE_TAG} --platform managed --region ${REGION} --allow-unauthenticated --project ${GCP_PROJECT_ID}
