#!/usr/bin/env bash

ROOT_DIR=$(pwd)

source $ROOT_DIR/.circleci/bin/utils.sh

function build_docker_image {
  export PATH=$PATH:/usr/local/gcloud/google-cloud-sdk/bin
  docker login -u _json_key -p "$(echo $GOOGLE_CREDENTIALS | base64 --decode)" https://gcr.io
  echo ${IMAGE_TAG} > current_version
  gsutil cp current_version gs://${REACT_APP_IMAGE_VERSION_PATH}
  docker build -f ./Dockerfile -t ${REACT_APP_IMAGE}:${IMAGE_TAG} .
  docker push ${REACT_APP_IMAGE}:${IMAGE_TAG}
}

build_docker_image
