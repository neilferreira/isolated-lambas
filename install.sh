#!/bin/bash

# Die on any errors
set -e

pip3 install pipenv==2023.5.19

#
# Install the package dependencies using pipenv
find . -type d -name "tests" | while IFS= read -r lambda; do
    cd $(dirname $lambda)
    echo "Running pipenv install -e . in $(dirname $lambda)"
    pipenv install -e .

    echo "Done with $lambda"

    cd -
done
