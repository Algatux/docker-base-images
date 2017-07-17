#!/bin/bash

# Catch errors
set -e
set -o pipefail

# Switch to root
cd "${0%/*}/../"

# Build the images
echo ""
echo "Pushing images.."

## TODO: Figure out how to properly redirect docker-make's output to /dev/null

echo ""
echo "  * Ubuntu 14.04"
if [ "$UPDATE_UBUNTU_14_04" == "1" ]; then
    echo -n "    > Building/pushing.. "
    eval $(./docker-make.sh -f .docker-make.ubuntu-14-04.yml) >/dev/null 2>&1
    echo -n "done!"
else
    echo -n "    > No update necessary, skipping.."
fi
echo ""

echo ""
echo "  * Ubuntu 16.04"
if [ "$UPDATE_UBUNTU_16_04" == "1" ]; then
    echo -n "    > Building/pushing.. "
    eval $(./docker-make.sh -f .docker-make.ubuntu-16-04.yml) >/dev/null 2>&1
    echo -n "done!"
else
    echo -n "    > No update necessary, skipping.."
fi
echo ""

echo ""
echo "  * Alpine 3.5"
if [ "$UPDATE_ALPINE_3_5" == "1" ]; then
    echo -n "    > Building/pushing.. "
    eval $(./docker-make.sh -f .docker-make.alpine-3-5.yml) >/dev/null 2>&1
    echo -n "done!"
else
    echo -n "    > No update necessary, skipping.."
fi
echo ""

echo ""
echo "Push completed successfully."
echo ""