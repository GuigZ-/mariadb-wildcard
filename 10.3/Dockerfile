FROM mariadb:10.3

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y --no-install-recommends install dialog

ADD wildcard.sh /docker-entrypoint-initdb.d/
