#!/bin/bash

# Die on any errors
set -e

#
# Install the package dependencies using pipenv
find . -type d -name "tests" | while IFS= read -r lambda; do
    cd $(dirname $lambda)
    echo "Running docker build . in $(dirname $lambda)"
    docker build .

    echo "Done with $lambda"

    cd -
done
