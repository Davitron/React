#!/usr/bin/env bash

ROOT_DIR=$(pwd)

# source $ROOT_DIR/.circleci/bin/utils.sh

checkout_deployment_scripts() {
  git clone -b master https://github.com/davitron/Turing_Devops_Project ${HOME}/deployments
}


run_terraform() {
  cd ${HOME}/deployments/
  python3 get_values.py
}

#run main
main() {
  checkout_deployment_scripts
  run_terraform
}

main #@