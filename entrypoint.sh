#!/bin/bash

set -e

# TODO: Improve entrypoint to support gitlab-runner
cd ${CI_PROJECT_DIR}
if [[ ! -z $SONAR_TOKEN ]]; then
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner ${1} -Dsonar.login ${SONAR_TOKEN}
else
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner ${1}
fi
