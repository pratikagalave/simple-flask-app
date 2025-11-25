# Use a small official Python image
FROM python:3.11-slim

# Set working dir
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose Flask port
EXPOSE 5000

# Use gunicorn to serve the app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app", "--workers", "2"]
