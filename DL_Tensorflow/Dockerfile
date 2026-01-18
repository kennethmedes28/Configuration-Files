# Use a stable TensorFlow GPU image
FROM tensorflow/tensorflow:2.18.0-gpu

# Set working directory
WORKDIR /workspace

# Copy requirements.txt into the container
COPY requirements.txt .

# Install Python packages and Jupyter Lab
RUN pip install --no-cache-dir -r requirements.txt
    # && pip install "protobuf<6" \
    # && pip install jupyterlab

# Expose Jupyter Lab port
EXPOSE 8888

# Default command: start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
