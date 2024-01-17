FROM osgeo/proj:9.3.1

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sqlite3

ADD sql /usr/share/proj/nl_nsgi_sql

RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_00_authorities.sql | sqlite3 /usr/share/proj/proj.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_10_copy_transformations_from_projdb.sql | sqlite3 /usr/share/proj/proj.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_20_datum_and_crs.sql | sqlite3 /usr/share/proj/proj.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_30_local_transformations.sql | sqlite3 /usr/share/proj/proj.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_40_regional_transformations.sql | sqlite3 /usr/share/proj/proj.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_50_wgs84_null_transformations.sql | sqlite3 /usr/share/proj/proj.db

RUN cp /usr/share/proj/proj.db /usr/share/proj/proj.global.time.dependent.transformations.db
RUN cat /usr/share/proj/nl_nsgi_sql/nl_nsgi_60_global_time_dependent_transformations.sql | sqlite3 /usr/share/proj/proj.global.time.dependent.transformations.db
