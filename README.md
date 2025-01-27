# DE2025

# DataEng2025

# Create the volumes to make the Postgres DB and the pgadmin configuration consistent
mkdir de_postgres_vol
mkdir de_pgadmin_vol
sudo chown 5050:5050 de_pgadmin_vol

#Build the image
docker build -t taxi_ingest:v2 .



#Ingest the trip data
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"
python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=green_taxi_trips \
  --url=${URL}



# Ingest the taxi zone
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv"
python data_load.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --tb=taxi_zone \
  --url=${URL}

  
Docker-Compose in detached mode:

docker-compose up -d