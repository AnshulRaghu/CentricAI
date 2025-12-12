# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy Python dependencies and install
COPY ../src/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY ../src/ ./src/

# Set PYTHONPATH so Python can find src modules
ENV PYTHONPATH=/app/src

# Default command (override in docker-compose or CLI)
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]