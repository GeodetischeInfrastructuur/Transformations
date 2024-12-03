ARG PYTHON_VERSION=3.12

FROM ghcr.io/astral-sh/uv:python${PYTHON_VERSION}-bookworm-slim

ARG PYTHON_VERSION
WORKDIR /app
COPY pyproject.toml uv.lock validate.py .python-version Z001_ETRS89andRDNAP.txt ./
RUN uv sync

# COPY the transformation grids, the modified proj.db and all the other proj files, so we do not have to run configure-proj.sh
COPY --from=ghcr.io/geodetischeinfrastructuur/transformations:latest /usr/share/proj/ "/app/.venv/lib/python${PYTHON_VERSION}/site-packages/pyproj/proj_dir/share/proj"

ENV PATH="/app/.venv/bin:$PATH"
ENV PROJ_DATA="/app/.venv/lib/python${PYTHON_VERSION}/site-packages/pyproj/proj_dir/share/proj"
