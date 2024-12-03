FROM osgeo/proj:9.5.0
RUN apt-get -y update &&  \
    apt-get install --no-install-recommends -y \
    sqlite3 && \
    rm -rf /var/lib/apt/lists/*
COPY sql /sql
COPY grids/nl_nsgi/ /grids
COPY configure-proj.sh /configure-proj.sh
RUN /configure-proj.sh /usr/share/proj /sql /grids
