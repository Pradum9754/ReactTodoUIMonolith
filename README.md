# ReactTodoUIMonolith
Full-stack ToDo application with React frontend, Flask backend, and SQL Server database. End-to-end deployment on Azure using Terraform and VM infrastructure. Includes CI/CD pipelines via Azure DevOps.

Full-Stack ToDo App 📝

ReactTodoUIMonolith

A full-stack ToDo application with React frontend, Flask backend, and SQL Server database. End-to-end deployed on Azure using Terraform and VM infrastructure, complete with CI/CD pipelines via Azure DevOps.

🔹 Features

Create, read, update, and delete tasks ✅

Fully responsive React frontend with MUI

Flask API backend connected to SQL Server

Production-ready deployment on Azure VMs

CI/CD automation with Azure Pipelines

Handles frontend-backend communication over public IPs

Optimized and secure build for real-world use

🔹 Tech Stack

Frontend: React, MUI, Axios

Backend: Python, Flask

Database: SQL Server

Infrastructure: Azure VMs, Terraform

DevOps: Azure Pipelines, CI/CD

🔹 Getting Started
1️⃣ Clone the repository
git clone https://github.com/YourUsername/ReactTodoUIMonolith.git
cd ReactTodoUIMonolith

2️⃣ Install dependencies

Frontend

cd frontend
npm install
npm run build


Backend

cd backend
pip3 install -r requirements.txt

3️⃣ Run the app

Backend

python3 app.py


Frontend
Serve the build folder with a static server:

npm install -g serve
serve -s build

🔹 Deployment

Infrastructure deployed via Terraform

Frontend and backend hosted on separate Azure VMs

Public IP configured for full-stack communication

Production-ready CI/CD with Azure Pipelines
