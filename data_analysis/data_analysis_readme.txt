docker build -f .devcontainer/Dockerfile -t data_analysis_app .
#-f .devcontainer/Dockerfile points to the correct file
#. sets the build context to your current folder, so ../requirements.txt works

docker run -it -p 8888:8888 data_analysis_app
docker run --rm -p 8888:8888 \
  -v "/home/kenneth/my_projects:/workspace" \
  data_analysis_app

# -i Interactive: Keeps STDIN open so you can interact with the container
# -t TTY: Allocates a pseudo-terminal for a better shell experience
# --rm Remove container after exit: Automatically deletes the container when it stops
# -p Port mapping: Maps port 8888 on your host to port 8888 in the container (used by JupyterLab)

