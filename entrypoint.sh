#!/bin/bash

set -e

${SONAR_SCANNER_HOME}/bin/sonar-scanner ${1}
