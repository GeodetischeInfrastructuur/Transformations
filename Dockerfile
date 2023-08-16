FROM osgeo/proj:9.2.1

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sqlite3

ADD nsgi.sql /usr/share/proj/nsgi.sql

# Adds the NSGI transformations to the proj.db
# TODO: The ngsi.sql is also added in the /user/share/proj dir
#       for completion, but we need to find a 'better' place for it.
RUN cat /usr/share/proj/nsgi.sql | sqlite3 /usr/share/proj/proj.db