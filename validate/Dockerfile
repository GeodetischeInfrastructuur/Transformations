FROM python:3.11.7-slim-bullseye

RUN apt-get update && \
    apt-get install -y \
        moreutils && \
    pip install --upgrade setuptools

RUN pip install pyproj==3.6.1

# COPY the transformation grids, the modified proj.db and all the other proj files
COPY --from=ghcr.io/geodetischeinfrastructuur/transformations:1.0.0 /usr/share/proj/ /usr/local/lib/python3.11/site-packages/pyproj/proj_dir/share/proj/
