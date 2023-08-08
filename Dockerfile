# Build
FROM osgeo/proj:9.2.1 as builder

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sqlite3

ADD nsgi.sql /usr/share/proj/nsgi.sql

RUN cat /usr/share/proj/nsgi.sql | sqlite3 /usr/share/proj/proj.db

# Release
FROM osgeo/proj:9.2.1 as release

# Adds the NSGI transformations to the proj.db
# TODO: The ngsi.sql is also added in the /user/share/proj dir
#       for completion, but we need to find a 'better' place for it.
COPY --from=builder /usr/share/proj/nsgi.sql /usr/share/proj/nsgi.sql
COPY --from=builder /usr/share/proj/proj.db /usr/share/proj/proj.db
