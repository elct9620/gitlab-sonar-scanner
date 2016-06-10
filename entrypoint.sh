#!/bin/bash

set -e

VERSION=${CI_BUILD_TAG:-"${CI_BUILD_REF_NAME}"}

# TODO: Improve entrypoint to support gitlab-runner
cd ${CI_PROJECT_DIR}
if [[ ! -z $SONAR_TOKEN ]]; then
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.login=${SONAR_TOKEN} -Dsonar.projectVersion=${VERSION}
else
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner
fi
