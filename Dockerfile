FROM python:3.9-slim

# Install critical system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt
COPY . .

# Explicit port and headless mode
EXPOSE 8080
CMD ["streamlit", "run", "--server.port=8080", "--server.headless=true", "cal.py"]