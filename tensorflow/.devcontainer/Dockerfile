# Base image with Python 3.11 and minimal system footprint
FROM python:3.11-slim-bookworm

# Set UTF-8 locale for NLP and Unicode compatibility
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Set environment variable for PySpark (Java 17)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libopenblas-dev \
    liblapack-dev \
    libhdf5-dev \
    libffi-dev \
    curl \
    git \
    openjdk-17-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Upgrade pip for reproducibility
RUN pip install --upgrade pip==23.3.1

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && python -m compileall .

# Expose ports for JupyterLab, MLflow, and monitoring
EXPOSE 8888 5000 8080

# Default command: launch JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
