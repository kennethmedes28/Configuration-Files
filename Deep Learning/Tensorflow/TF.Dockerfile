# # Base image with CUDA 12.2 and cuDNN 8 (GPU acceleration)
# FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

# # Environment variables
# ENV LANG=C.UTF-8 \
#     LC_ALL=C.UTF-8 \
#     DEBIAN_FRONTEND=noninteractive \
#     TZ=UTC \
#     CUDA_HOME=/usr/local/cuda \
#     PATH=/usr/local/cuda/bin:${PATH} \
#     LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH} \
#     TF_FORCE_GPU_ALLOW_GROWTH=true \
#     NVIDIA_DRIVER_CAPABILITIES=compute,utility \
#     JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# # Install system dependencies, Python 3.11, and Java in single RUN
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     software-properties-common \
#     ca-certificates \
#     git \
#     build-essential \
#     libopenblas-dev \
#     liblapack-dev \
#     libhdf5-dev \
#     libffi-dev \
#     python3.10 \
#     python3.10-dev \
#     python3-pip \
#     openjdk-17-jdk-headless \
#     && rm -rf /var/lib/apt/lists/* \
#     && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 \
#     && python -m pip install --upgrade pip setuptools wheel

# # Set working directory
# WORKDIR /workspace

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose common ML ports
# EXPOSE 8888 5000 8080

# # Default shell
# CMD ["/bin/bash"]
