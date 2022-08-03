
FROM python:3.10.4-slim-bullseye as currency-requirements

WORKDIR /tmp

# Install poetry and copy poetry files
RUN pip install poetry
COPY ./pyproject.toml /tmp/

# Generate requirements.txt
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes


FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg-agent \
    software-properties-common && \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && apt-get install -y consul

WORKDIR /app

COPY --from=currency-requirements /tmp/requirements.txt /app/requirements.txt
RUN --mount=type=cache,target=/root/.cache \
    pip install --upgrade -r /app/requirements.txt

COPY . .
EXPOSE 80


COPY ./client.hcl /consul/config/client.hcl

CMD ["/bin/bash", "run.sh"]
