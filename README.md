# UseGalaxy.eu Workflow Testing

Based off of [jmchilton's template](https://github.com/jmchilton/planemo-workflow-test-template), except running tests against UseGalaxy.eu

## Testing

We are [automatically running](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/) these workflows weekly against UseGalaxy.eu

Workflow                   | Status
---                        | ---
example1/wf3-shed-tools.ga | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example1%2Fwf3-shed-tools.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example1%2Fwf3-shed-tools.ga/)
example2/wf4-shed-tools.ga | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example2%2Fwf4-shed-tools.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example2%2Fwf4-shed-tools.ga/)

## Test Files

For providing test files, each folder contains a `urls.txt` which contains a set of URLs that should be downloaded.
