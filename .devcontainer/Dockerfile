FROM python:3.9-slim-buster

# ENV_TEST variable is useful for poetry installation, we install only dev dependencies if it is set to True.
ARG POETRY_VERSION="1.2.1"

# Install dependencies
ENV POETRY_HOME="/.poetry"

RUN apt -y -q update && \
    apt -y -q install curl && \
    apt -y install make && \
    apt -y install git && \
    python -m venv /poetry/venvs && \
    curl -sSL https://install.python-poetry.org | python - --version  ${POETRY_VERSION} && \
    curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz && \
    mkdir -p /usr/local/gcloud && \
    tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz && \
    /usr/local/gcloud/google-cloud-sdk/install.sh && \
    apt-get -y -q --purge autoremove curl && \
    apt-get -y -q clean autoclean && \
    rm -rf /var/lib/apt/lists/*

# Add to PATH
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
ENV PATH="${POETRY_HOME}/bin:${PATH}"

# /poetry/venvs should be mounted as a volume for performance
ENV PATH=/poetry/venvs/bin:$PATH \
    VIRTUAL_ENV=/poetry/venvs

# Configure Poetry to not create a new virtual environment, it will reuse the one created by python above
RUN poetry config virtualenvs.create false

# Set profiles dir
RUN mkdir -p /workspaces/dbt-gcp-demo/src/dbt
ENV DBT_PROFILES_DIR=/workspaces/dbt-gcp-demo/src/dbt

CMD [ "poetry run dbt" ]
