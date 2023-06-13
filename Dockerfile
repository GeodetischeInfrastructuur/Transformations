from osgeo/proj:latest as builder

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sqlite3

ADD NSGI_PROJdb.sql /usr/share/proj/NSGI_PROJdb.sql

RUN cat /usr/share/proj/NSGI_PROJdb.sql | sqlite3 /usr/share/proj/proj.db

RUN apt remove sqlite3 -y \
    && apt autoremove -y



