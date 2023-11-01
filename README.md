# docker-postgresql15-pgbigm
A docker file for Postgresql 15 with the pg_bigm extension installed

pg_bigm is a full text search module for postgresql which allows for the creation of 2-gram (bigram) indexes.  Official Documenation is [here.](https://pgbigm.osdn.jp/pg_bigm_en-1-2.html)

This extension is [available by default on AWS RDS Postgres sql instances](https://aws.amazon.com/about-aws/whats-new/2021/06/amazon-aurora-postgresql-supports-pg-bigm-extension-for-faster-full-text-search/) so this image is intended primarily for local development.

## Build
```sh
docker build . -t postgres-bigm
```

## Run Locally
```sh
docker run --rm --name psql -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres-bigm
```

## Connect Locally
Connect with psql locally:
```sh
PGPASSWORD=password psql -h localhost -U postgres
```

The connection string would be:
`postgresql://postgres:password@localhost:5432?schema=public`


## Enable Extension
Your DB migrations should ensure the extension is enabled by running the following SQL command: 

```sql
CREATE EXTENSION pg_bigm;
```

You can verify the extension is enabled by connecting to the db with `psql` and using `\dx`:

```
postgres=# \dx
                                   List of installed extensions
  Name   | Version |   Schema   |                           Description
---------+---------+------------+------------------------------------------------------------------
 pg_bigm | 1.2     | public     | text similarity measurement and index searching based on bigrams
 plpgsql | 1.0     | pg_catalog | PL/pgSQL procedural language
(2 rows)
```

or `\dx pg_bigm`: 
```
postgres=# \dx pg_bigm
                                 List of installed extensions
  Name   | Version | Schema |                           Description
---------+---------+--------+------------------------------------------------------------------
 pg_bigm | 1.2     | public | text similarity measurement and index searching based on bigrams
(1 row)
```
