FROM python:3.10.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    python3-dev \
    libgirepository1.0-dev \
    libcairo2-dev \
    libdbus-1-dev \
    gcc \
    libsystemd-dev \
    ufw \
    unattended-upgrades \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip3 install --no-cache-dir --prefer-binary -r requirements.txt

COPY . .

ENV FLASK_APP=server.py

# Expose port 5000 to allow external traffic to the container
EXPOSE 5000

# Run Flask app on 0.0.0.0 to make it accessible outside the container
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]
