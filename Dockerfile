FROM postgres:15

RUN apt update
RUN apt install -y postgresql-server-dev-15 make gcc wget libicu-dev curl

RUN curl -L -o pg_bigm-2383574.tar.gz http://git.osdn.net/view\?p\=pgbigm/pg_bigm.git\;a\=snapshot\;h\=2383574e80027aae29e63d37cb3cb2641b28cdce\;sf\=tgz
RUN tar -zxf pg_bigm-2383574.tar.gz
RUN cd pg_bigm-2383574 && make USE_PGXS=1 && make USE_PGXS=1 install

RUN echo shared_preload_libraries='pg_bigm' >> /etc/postgresql.conf

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
