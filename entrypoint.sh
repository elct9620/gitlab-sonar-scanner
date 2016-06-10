#!/bin/bash

set -e

VERSION=${CI_BUILD_TAG:-"${CI_BUILD_REF_NAME}"}

OPTS="-Dsonar.projectVersion=${VERSION} -Dsonar.gitlab.project_id=${CI_PROJECT_ID} -Dsonar.gitlab.commit_sha=${CI_BUILD_REF} -Dsonar.gitlab.ref_name=${CI_BUILD_REF_NAME} -Dsonar.issuesReport.console.enable=true"

# TODO: Improve entrypoint to support gitlab-runner
cd ${CI_PROJECT_DIR}
if [[ ! -z $SONAR_TOKEN ]]; then
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.login=${SONAR_TOKEN} ${OPTS}
else
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner ${OPTS}
fi
