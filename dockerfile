FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source
COPY src/ ./src/
COPY models/ ./models/

ENV MODEL_PATH=models/gradient_boosting.pkl
ENV MLFLOW_TRACKING_URI=sqlite:///mlflow.db

EXPOSE 8000

CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8000"]
