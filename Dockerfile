FROM python:3.9.1

RUN apt-get install wget

RUN pip install pandas sqlalchemy psycopg2 pyarrow


WORKDIR /app

COPY ingest_data.py ingest_data.py
COPY data_load.py data_load.py
ENTRYPOINT ["python", "ingest_data.py","data_load.py"]