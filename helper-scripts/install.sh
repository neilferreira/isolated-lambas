#!/bin/bash

# Die on any errors
set -e

pip3 install -U poetry

#
# Install the package dependencies using pipenv
find . -type d -name "tests" | while IFS= read -r lambda; do
    cd $(dirname $lambda)

    echo "Adding shared requirements to $(dirname $lambda)"
    poetry add --group shared $(cat ../../shared-requirements.txt)

    poetry add --group dev pytest-cov

    echo "Calling poetry install to $(dirname $lambda)"
    poetry install

    echo "Done with $lambda"

    cd -
done
