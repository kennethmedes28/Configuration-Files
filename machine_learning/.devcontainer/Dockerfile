FROM python:3.11-slim-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    firefox-esr \
    chromium \
    curl \
    unzip \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libdrm2 \
    libxcomposite1 \
    libxrandr2 \
    libxss1 \
    libasound2 \
    libxdamage1 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# Optional: Install ChromeDriver for Selenium
RUN curl -sSL https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip -o chromedriver.zip \
    && unzip chromedriver.zip \
    && mv chromedriver /usr/local/bin/chromedriver \
    && chmod +x /usr/local/bin/chromedriver \
    && rm chromedriver.zip

# Set working directory
WORKDIR /workspace

# Copy requirements and install Python packages
COPY ../requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose ports for JupyterLab and MLflow
EXPOSE 8888
EXPOSE 5000
EXPOSE 8080

# Default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
