# UseGalaxy.eu Workflow Testing

Based off of [jmchilton's template](https://github.com/jmchilton/planemo-workflow-test-template), except running tests against UseGalaxy.eu

## Testing

We are [automatically running](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/) these workflows weekly against UseGalaxy.eu

Workflow                                                  | Status
---                                                       | ---
example1/wf3-shed-tools.ga                                | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example1%2Fwf3-shed-tools.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example1%2Fwf3-shed-tools.ga/)
example2/wf4-shed-tools.ga                                | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example2%2Fwf4-shed-tools.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example2%2Fwf4-shed-tools.ga/)
HiCExplorer/scratch-to-contact.ga                         | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=HiCExplorer%2Fscratch-to-contact.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=HiCExplorer%2Fscratch-to-contact.ga/)
example_blockclust/blockclust_workflow.ga                 | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example_blockclust%2Fblockclust_workflow.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=example_blockclust%2Fblockclust_workflow.ga/)
training/workflows/microbial_variant_calling.ga           | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmicrobial_variant_calling.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmicrobial_variant_calling.ga/)
training/workflows/quality_control.ga                     | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fquality_control.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fquality_control.ga/)
training/workflows/formation_of_super_structures_on_xi.ga | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fformation_of_super_structures_on_xi.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fformation_of_super_structures_on_xi.ga/)
training/workflows/amplicon.ga                            | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Famplicon.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Famplicon.ga/)
training/workflows/unicycler.ga                           | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Funicycler.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Funicycler.ga/)
training/workflows/ref_based.ga                           | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fref_based.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fref_based.ga/)
training/workflows/mapping.ga                             | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmapping.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmapping.ga/)
training/workflows/assembly-general-introduction.ga       | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fassembly-general-introduction.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fassembly-general-introduction.ga/)
training/workflows/methylation-seq.ga                     | [![Build Status](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmethylation-seq.ga/badge/icon)](https://build.usegalaxy.eu/job/usegalaxy.eu/job/workflow-testing/PYTHON=System-CPython-2.7,WORKFLOW=training%2Fworkflows%2Fmethylation-seq.ga/)


## Test Files

For providing test files, each folder contains a `urls.txt` which contains a set of URLs that should be downloaded.
