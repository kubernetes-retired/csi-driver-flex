#! /bin/bash

# Only these tests work for csi-drivers-flex, E2E and sanity testing
# will require further work.
: ${CSI_PROW_TESTS:="unit"}

. release-tools/prow.sh

main
