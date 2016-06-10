#!/bin/bash

set -e

cd ${CI_PROJECT_DIR}
${SONAR_SCANNER_HOME}/bin/sonar-scanner ${1}
