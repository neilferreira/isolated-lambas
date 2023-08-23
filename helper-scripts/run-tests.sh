#!/bin/bash

# Die on any errors
set -e

#
# Run the actual tests
find . -type d -name "tests" | while IFS= read -r lambda; do
    cd $(dirname $lambda)
    echo "Running pytest in $(dirname $lambda)"
    pipenv run pytest -s --log-cli-level=INFO
    cd -
done
