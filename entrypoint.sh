#!/bin/bash

set -e

echo ${1}
# TODO: Improve entrypoint to support gitlab-runner
cd ${CI_PROJECT_DIR}
if [[ ! -z $SONAR_TOKEN ]]; then
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.login=${SONAR_TOKEN}
else
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner
fi
