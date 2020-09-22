#!/bin/bash
#
source "$(dirname ${0})/common.sh"

#%
#% Sonar Scanner for Javascript/Typescript
#%
#%   This command runs a sonar scan for a typescript codebase
#%   Targets incl.: pr-###, dev and master.
#%
#% Usage:
#%
#%   ${THIS_FILE} [JOB_NAME] [-apply]
#%
#% Examples:
#%
#%   Provide a job name. Defaults to a dry-run.
#%   ${THIS_FILE} dev
#%
#%   Apply when satisfied.
#%   ${THIS_FILE} dev -apply
#%
#%   Set variables to non-defaults at runtime.
#%   SONAR_URL=http://localhost:9000 SONAR_PROJECT_KEY=my-project-key ${THIS_FILE} dev -apply

# Receive parameters (source and destination)
#
TARGET=${TARGET:-dev}
SONAR_PROJECT_KEY=${SONAR_PROJECT_KEY:-web-${TARGET}}
SONAR_PROJECT_NAME=${SONAR_PROJECT_NAME:-Sheriff Scheduling Web [${TARGET}]}
SONAR_URL=${SONAR_URL:-https://sonarqube-jag-shuber-tools.pathfinder.gov.bc.ca}
ZAP_REPORT=${ZAP_REPORT:-}

FRONTEND_DIR="${FRONTEND_DIR:-../web}"

# Check requirements
#
which sonar-scanner >/dev/null 2>&1 || {
  fatal_error "sonar-scanner not installed on not in PATH"
}

# Clean up any previous test run
#
rm -rf ".sonarqube/"

# Begin analysis
#
CMD_SONAR_SCAN="sonar-scanner \
  -Dsonar.projectKey='web-${TARGET}' \
  -Dsonar.projectName='Sheriff Scheduling [${TARGET}]' \
  -Dsonar.host.url='${SONAR_URL}' \
  -Dsonar.login='35f9f849e179f9a0957251860e55ee006cbcbc3c'
  -Dsonar.zaproxy.reportPath='./zap-report.xml'"

# Execute commands
#
if [ "${APPLY}" ]; then
  cp ${ZAP_REPORT} ${FRONTEND_DIR}
  pushd ${FRONTEND_DIR}
  ls
  eval "${CMD_SONAR_SCAN}"
  popd
fi

display_helper "${CMD_TEST}" "${CMD_SONAR_SCAN}"
