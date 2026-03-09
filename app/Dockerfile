# Uses docker hub image for python usage
FROM python:3.12-slim

# Sets main directory on container to copy into
WORKDIR /app

# Copy requirements list into container
COPY requirements.txt .

# Install required python packages on build
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files into container
COPY . .

# Set port for uvicorn
ENV PORT=8080

# Run main.py
CMD ["python3", "main.py"]

# Expose application
EXPOSE 8080
