FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    HF_HOME=/workspace/hf_cache

WORKDIR /workspace

# System deps (minimal + safe)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip (no cache already handled by ENV)
RUN pip install --upgrade pip

# Copy only requirements first (better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Create HF cache dir
RUN mkdir -p ${HF_HOME}

# Copy project files
COPY . .

# Expose Jupyter port
EXPOSE 8888

# Default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]