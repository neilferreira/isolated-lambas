FROM python:3.11.0-slim

    RUN pip install -U poetry==1.6.1

    # The basics - create a directory for our application
    RUN mkdir /opt/application
    WORKDIR /opt/application

    ENV \
        # python:
        PYTHONFAULTHANDLER=1 \
        PYTHONUNBUFFERED=1 \
        PYTHONHASHSEED=random \
        PYTHONDONTWRITEBYTECODE=1 \
        # pip:
        PIP_NO_CACHE_DIR=off \
        PIP_DISABLE_PIP_VERSION_CHECK=on \
        PIP_DEFAULT_TIMEOUT=100

    ADD poetry.lock .
    ADD pyproject.toml .

    RUN poetry export -f requirements.txt --with shared --without-hashes > requirements.txt
    RUN pip install -r requirements.txt -t .

    # Delete Python artifacts that may change each time that the image is re-built
    # This causes a deployment performance hit that results in Lambdas rebuilding for no actual reason when
    # *.pyc or *.dist-info files are updated.
    RUN find . -type f -name "*.py[co]" -delete
    RUN find . -type d -name "__pycache__" -delete

    ADD src/* .
