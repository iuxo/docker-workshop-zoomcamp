# Workshop for docker

Goes over setup of Docker, Dockerfile, and setting up Postgres as well as PGAdmin for easy access.

Creates a simple pipeline to add data from [taxi cab data](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

Follows instructions from zoom link as well as this [tutorial](https://github.com/alexeygrigorev/workshops/tree/main/dezoomcamp-docker)



# Commands

To start Postgres database as well as admin.
`docker-compose up`

To run ingestion script
```
docker run -it --rm `
  --network=pipeline_default `
  taxi_ingest:v001 `
  --pg-user=root `
  --pg-pass=root `
  --pg-host=pgdatabase `
  --pg-port=5432 `
  --pg-db=ny_taxi `
  --target-table=yellow_taxi_trips_2021_2 `
  --year=2021 `
  --month=2 `
  --chunksize=100000
```
