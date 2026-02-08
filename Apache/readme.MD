# --build → Do the build. “Make sure the image is up to date”.

# --progress=plain → Show build details. “Show me everything the build is doing”.

# logs → Show running container output. What is my app doing right now?”

docker compose build --progress=plain
docker compose build --no-cache --progress=plain 
docker compose logs -f

- NameNode → http://localhost:9870
- ResourceManager → http://localhost:8088
- NodeManager → http://localhost:8042
- Spark Master → http://localhost:8080
- Spark Worker → http://localhost:8081