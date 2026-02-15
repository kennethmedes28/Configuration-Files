# --build → Do the build. “Make sure the image is up to date”.

# --progress=plain → Show build details. “Show me everything the build is doing”.

# logs → Show running container output. What is my app doing right now?”

docker compose build --progress=plain
docker compose build --no-cache --progress=plain 
docker compose logs -f

docker exec -it nodemanager ping resourcemanager

- NameNode → http://localhost:9870
- ResourceManager → http://localhost:8088
- NodeManager → http://localhost:8042
- Spark Master → http://localhost:8080
- Spark Worker → http://localhost:8081

Step 1: Create a Kafka Topic
    docker exec -it kafka kafka-topics.sh \
  --create --topic events \
  --bootstrap-server localhost:9092

Step 2: Produce Messages into Kafka
docker exec -it kafka kafka-console-producer.sh \
  --topic events --bootstrap-server localhost:9092

Step 3: Spark Streaming Job Consumes Kafka
docker exec -it spark-master spark-submit \
  --class org.apache.spark.examples.streaming.KafkaWordCount \
  --master spark://spark-master:7077 \
  /opt/bitnami/spark/examples/jars/spark-examples_2.12-3.5.0.jar \
  localhost:9092 events

 Step 4: Store Results in HDFS
 docker exec -it namenode hdfs dfs -ls /user/root
docker exec -it namenode hdfs dfs -cat /user/root/output/*


### PYTHON CODE

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, from_json
from pyspark.sql.types import StructType, StringType, IntegerType

# 1. Initialize Spark Session with Kafka support
spark = SparkSession.builder \
    .appName("KafkaToHDFS") \
    .getOrCreate()

spark.sparkContext.setLogLevel("WARN")

# 2. Define schema for incoming Kafka messages (adjust to your payload)
schema = StructType() \
    .add("user_id", StringType()) \
    .add("event_type", StringType()) \
    .add("timestamp", StringType()) \
    .add("value", IntegerType())

# 3. Read stream from Kafka
kafka_stream = spark.readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", "kafka:9092") \
    .option("subscribe", "events-topic") \
    .option("startingOffsets", "latest") \
    .load()

# 4. Parse Kafka value (binary) into JSON
parsed_stream = kafka_stream.selectExpr("CAST(value AS STRING) as json") \
    .select(from_json(col("json"), schema).alias("data")) \
    .select("data.*")

# 5. Write structured data into HDFS (append mode)
query = parsed_stream.writeStream \
    .format("json") \
    .option("path", "hdfs://namenode:9000/user/spark/kafka_output") \
    .option("checkpointLocation", "hdfs://namenode:9000/user/spark/checkpoints/kafka_output") \
    .outputMode("append") \
    .start()

query.awaitTermination()

###

- Kafka Source: Connects to your Kafka broker (kafka:9092) and subscribes to events-topic.
- Schema Enforcement: Parses each Kafka message into structured fields (user_id, event_type, etc.).
- HDFS Sink: Writes JSON files into HDFS under /user/spark/kafka_output, with checkpointing for fault tolerance.

docker cp kafka_to_hdfs.py spark-master:/opt/spark-apps/

docker exec -it spark-master \
  spark-submit \
  --master yarn \
  --deploy-mode cluster \
  /opt/spark-apps/kafka_to_hdfs.py

docker exec -it namenode hdfs dfs -ls /user/spark/kafka_output

# Storing File in Hadoop
hdfs dfs -put localfile.txt /user/kenneth/data/
hdfs dfs -get /user/kenneth/data/localfile.txt .
hdfs dfs -ls /user/kenneth/data/

### Python
from pyarrow import hdfs
fs = hdfs.connect('namenode', 9000)
with fs.open('/user/kenneth/data/output.json', 'wb') as f:
    f.write(b'{"user":"123","event":"click"}')

5. Hive / HCatalog
- Define tables over HDFS directories

CREATE EXTERNAL TABLE events (
  user_id STRING,
  event_type STRING,
  ts STRING
) 
STORED AS PARQUET
LOCATION '/data/raw/events/';

### Sample Python-Spark Script
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_date

# 1. Start Spark session
spark = SparkSession.builder \
    .appName("SimpleETLPipeline") \
    .getOrCreate()

# 2. Load raw data (CSV, JSON, Parquet, etc.)
df = spark.read.csv("data/raw/events.csv", header=True, inferSchema=True)

# 3. Basic transformations
df_clean = df.dropna() \
    .withColumn("event_date", to_date(col("timestamp")))

# 4. Write curated data back to storage
df_clean.write.mode("overwrite").parquet("data/curated/events_parquet")

spark.stop()

###