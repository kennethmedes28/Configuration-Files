docker build -t ml-container .
docker build -t ml-container -f .devcontainer/Dockerfile .
docker run -p 8888:8888 -v $(pwd):/workspace ml-container
