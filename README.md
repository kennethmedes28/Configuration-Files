# Machine Learning Engineering/Data Scientist Portfolio

Welcome to my comprehensive ML engineering/Data Scientist repository. This project showcases my expertise in building, deploying, and monitoring machine learning systems at scale.

## 👨‍💻 About Me

I'm an ML engineer/Data Scientist with hands-on experience in:
- **Machine Learning & Deep Learning**: PyTorch, TensorFlow, model training and optimization
- **Data Engineering**: Data analysis, ETL pipelines, dataset management
- **Infrastructure & DevOps**: Docker, Kubernetes, CI/CD automation with Jenkins
- **Monitoring & Observability**: Prometheus & Grafana production system monitoring
- **Database Management**: PostgreSQL, MongoDB, data persistence strategies
- **Workflow Automation**: N8N for orchestrating ML pipelines

## 📁 Repository Structure

```
Configuration-Files/
├── machine_learning/          # ML model training configurations & setup
├── PyTorch_DeepLearning/      # PyTorch-based deep learning projects
├── Tensorflow_DeepLearning/   # TensorFlow/Keras implementations
├── data_analysis/             # Data exploration and analysis workflows
├── database/                  # Database configurations
│   ├── postgres_sql/          # PostgreSQL setup and schemas
│   └── mongo_db/              # MongoDB configuration
├── kubernetes/                # K8s deployment manifests
├── ci-cd/                     # CI/CD pipelines (Jenkins automation)
├── monitoring/                # Prometheus monitoring stack
├── n8n/                       # Workflow automation configurations
└── DATASETS/                  # Raw and processed datasets for analysis
    ├── CSV/                   # Netflix, Superstore, and other datasets
└──Notebook Files/             # Jupyter notebooks for exploration
```

## 🛠️ Tech Stack

### Machine Learning & Data Science
- **Deep Learning Frameworks**: PyTorch, TensorFlow, Keras
- **Data Processing**: Pandas, NumPy, scikit-learn
- **Visualization**: Matplotlib, Seaborn, Plotly

### Infrastructure & Deployment
- **Containerization**: Docker, Docker Compose
- **Orchestration**: Kubernetes
- **CI/CD**: Jenkins, automated testing pipelines
- **Monitoring**: Prometheus & Grafana custom dashboards

### Databases
- **Relational**: PostgreSQL
- **NoSQL**: MongoDB
- **ORM/ODM**: SQLAlchemy, Mongoose

### Workflow & Automation
- **Pipeline Orchestration**: N8N
- **Version Control**: Git
- **Environment Management**: Python virtual environments, Docker

## 🚀 Key Projects & Configurations

### 1. Machine Learning Models
- PyTorch and TensorFlow implementations
- Model training, evaluation, and optimization
- Hyperparameter tuning and experiment tracking

### 2. Data Analysis
- Netflix titles dataset analysis
- E-commerce (Superstore) data exploration
- Statistical analysis and feature engineering

### 3. Production Deployment
- Containerized applications with Docker
- Kubernetes-ready configurations
- Health checks and resource management

### 4. Monitoring & Observability
- Prometheus metrics collection
- Custom dashboards for model performance
- System health monitoring

### 5. CI/CD Pipeline
- Automated testing with Jenkins
- Docker image building and pushing
- Deployment automation

## 📊 Datasets

- **Netflix Titles**: Movie/TV show metadata and categorization analysis
- **Superstore Orders**: E-commerce sales and customer behavior analysis
- Custom datasets for ML model training and evaluation

## 🔧 Quick Start

### Prerequisites
- Docker & Docker Compose
- Python 3.8+
- Kubernetes (optional, for full deployment)
- Git

### Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Configuration-Files
   ```

2. **Install dependencies**
   ```bash
   pip install -r machine_learning/requirements.txt
   pip install -r data_analysis/requirements.txt
   ```

3. **Run ML models**
   ```bash
   # PyTorch training
   cd PyTorch_DeepLearning
   python train.py

   # TensorFlow training
   cd ../Tensorflow_DeepLearning
   python train.py
   ```

4. **Deploy with Docker**
   ```bash
   docker-compose up -d
   ```

5. **Monitor with Prometheus**
   ```bash
   # Prometheus runs on http://localhost:9090
   docker-compose -f monitoring/docker-compose.yml up -d
   ```

## 📈 Skills Highlighted

✅ End-to-end ML pipeline development  
✅ Production-grade model deployment  
✅ Infrastructure as Code (IaC)  
✅ CI/CD automation and DevOps practices  
✅ Data engineering and analysis  
✅ System monitoring and logging  
✅ Cloud-ready containerized applications  
✅ Team collaboration with Git workflows  

## 🎯 Current Learning Areas

- Advanced Kubernetes orchestration
- Redis caching strategies
- Nginx reverse proxy configurations
- Distributed ML training
- Model serving optimization

## 📝 Documentation

Each subdirectory contains detailed README files with specific setup instructions:
- `machine_learning/README.md` - ML model setup
- `database/README.md` - Database configuration
- `kubernetes/README.md` - K8s deployment
- `ci-cd/README.md` - Pipeline setup
- `monitoring/README.md` - Observability stack

## 🤝 Contributing

This is a portfolio project showcasing ML engineering practices. Feel free to explore and adapt configurations for your use cases.

## 📞 Contact

For inquiries about ML engineering projects or collaborations, feel free to reach out.

Email: krukkruk28@gmail.com

---

**Last Updated**: December 30, 2025  
**Status**: Active Development
