FROM osgeo/proj:9.3.1

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sqlite3

ADD nl_nsgi.sql /usr/share/proj/nl_nsgi.sql

# Adds the NSGI transformations to the proj.db
# TODO: The nl_ngsi.sql is also added in the /user/share/proj dir
#       for completion, but we need to find a 'better' place for it.
RUN cat /usr/share/proj/nl_nsgi.sql | sqlite3 /usr/share/proj/proj.db