FROM python:3.11.7-slim-bullseye

RUN apt-get update && \
    apt-get install -y \
        moreutils && \
    pip install --upgrade setuptools

RUN pip install pyproj==3.7.0

# COPY the transformation grids, the modified proj.db and all the other proj files
COPY --from=ghcr.io/geodetischeinfrastructuur/transformations:2.0.0 /usr/share/proj/ /usr/local/lib/python3.11/site-packages/pyproj/proj_dir/share/proj/
