FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libgomp1 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt
COPY . .

# Explicitly set port for Amplify compatibility
EXPOSE 8080

# Run Streamlit on port 8080
CMD ["streamlit", "run", "--server.port=8080", "cal.py"]