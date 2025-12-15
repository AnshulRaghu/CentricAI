# CentricAI 💸📊  
**An End-to-End AI System for Personal Finance Intelligence**

CentricAI is a modular, production-style AI system that analyzes personal financial transaction data and provides **spending predictions, anomaly detection, and actionable financial insights**.  
The system is built using modern **machine learning, API design, containerization, and monitoring tools**, demonstrating a full ML lifecycle from data ingestion to deployment and observability.

---

## ✨ Key Features

- 📈 **Spending Prediction**
  - Predicts future spending amounts using a trained **RandomForestRegressor**
- 🚨 **Anomaly Detection**
  - Detects unusual or risky transactions using **Isolation Forest**
- 🧠 **Feature Engineering & Preprocessing**
  - Time-based and categorical features extracted from transaction data
- ⚙️ **API-First Design**
  - Exposes ML models via a FastAPI service
- 🐳 **Dockerized Deployment**
  - Fully containerized for reproducibility and portability
- 📊 **Monitoring & Observability**
  - Prometheus metrics + Grafana dashboards for system health and usage tracking

---

## 🧠 Dataset

CentricAI uses the **Mock Personal Finance Data** dataset from Kaggle.

**Dataset characteristics:**
- Synthetic financial transaction records (~4 years)
- Columns:
  - `Date`
  - `Transaction Description`
  - `Category` (Food, Rent, Utilities, Income, etc.)
  - `Amount`
  - `Type` (Income / Expense)

The dataset is used to:
- Learn spending patterns
- Forecast future expenses
- Identify abnormal financial behavior

---

## 🏗️ Project Architecture

CentricAI/
├── data/ # Transaction data (CSV)
├── models/ # Trained ML model artifacts (.pkl)
├── src/ # Core application logic
│ ├── models/ # Model wrappers & loaders
│ ├── training/ # Model training pipelines
│ ├── util/ # Data loading, preprocessing, feature engineering
│ ├── main.py # FastAPI entrypoint
│ └── test_models.py # Model verification tests
├── deployment/
│ ├── Dockerfile
│ └── docker-compose.yml
├── monitoring/
│ ├── prometheus/ # Prometheus config & alerts
│ └── grafana/ # Grafana dashboards & datasources
├── README.md


---

## 🔄 System Flow

1. **Data Ingestion**
   - Load transaction data from CSV (Kaggle dataset)
2. **Preprocessing & Feature Engineering**
   - Date parsing, category encoding, time-based features
3. **Model Training**
   - Spending prediction (Random Forest)
   - Anomaly detection (Isolation Forest)
4. **Model Serving**
   - Models loaded via FastAPI endpoints
5. **Monitoring**
   - Metrics exposed at `/metrics`
   - Visualized using Prometheus + Grafana

---

## 🚀 Running the Project

### 1️⃣ Build the API Docker Image

From the project root:

```bash
docker build -t centricai-api -f deployment/Dockerfile .

2️⃣ Start the Full Stack (API + Monitoring)
docker-compose -f deployment/docker-compose.yml up

3️⃣ Access Services
Service	URL
API Docs	http://localhost:8000/docs

API Health	http://localhost:8000/health

Metrics	http://localhost:8000/metrics

Prometheus	http://localhost:9090

Grafana	http://localhost:3000

Grafana Login

Username: admin

Password: admin

🧪 Model Testing

To verify trained models:

docker run --rm -it \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/models:/app/models \
  centricai-api python -m src.test_models

📊 Monitoring & Metrics

The system exposes Prometheus-compatible metrics, including:

Request count

Request latency

Prediction calls

Anomaly detection usage

Grafana dashboards visualize:

API traffic over time

Model inference volume

System health indicators

🎯 Project Goals

Demonstrate end-to-end ML system design

Apply MLOps best practices

Bridge machine learning and backend engineering

Provide interpretable financial insights from raw transaction data

🔮 Future Improvements

User-specific financial profiling

Budget recommendation engine

LLM-powered financial explanations

Model retraining pipelines (CI/CD)

Authentication & user accounts

👤 Author

Anshul Raghu
Master’s Student — AI Systems
Project: CentricAI

📄 License

This project is for academic and educational purposes.