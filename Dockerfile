
# Adapted from docker-uv-renv by Daniel Chen (MIT License)
# https://github.com/chendaniely/docker-uv-renv

# Start from Ubuntu Linux
FROM ubuntu:24.04

# Copy the uv program into the image
COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

# Work inside the image
WORKDIR /workspace

# Store installed packages here
ENV UV_PROJECT_ENVIRONMENT=/opt/venv

# Copy the project dependency files
COPY pyproject.toml uv.lock .python-version ./

# Install Python and the exact locked packages
RUN uv sync --locked

