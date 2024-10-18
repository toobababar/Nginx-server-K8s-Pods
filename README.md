# NGINX Kubernetes Deployment on Minikube

This project demonstrates deploying an NGINX server on Kubernetes using Minikube. The project involves creating a custom Docker image, deploying it to a Kubernetes cluster, and exposing the deployment as a service.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Overview](#project-overview)
- [Installation and Setup](#installation-and-setup)
  - [Step 1: Set up Minikube](#step-1-set-up-minikube)
  - [Step 2: Build the Docker Image](#step-2-build-the-docker-image)
  - [Step 3: Deploy the NGINX Pod](#step-3-deploy-the-nginx-pod)
  - [Step 4: Expose the Deployment](#step-4-expose-the-deployment)
  - [Step 5: Access the NGINX Service](#step-5-access-the-nginx-service)
- [Project Files](#project-files)
- [Resources](#resources)

## Prerequisites

Before running this project, ensure that you have the following installed on your machine:
- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

Additionally, make sure Docker is configured to use Minikube's Docker environment.

## Project Overview

This project demonstrates how to:
- Set up a Kubernetes cluster using Minikube.
- Create a custom NGINX Docker image.
- Deploy the NGINX container to a Kubernetes pod.
- Expose the NGINX service for external access using NodePort.

## Installation and Setup

Follow the steps below to set up and run this project on your local machine.

### Step 1: Set up Minikube

Start by setting up Minikube and configuring your terminal to use its Docker environment.

1. Start Minikube:
   ```bash
   minikube start --driver=docker
   
2. Point your Docker CLI to use Minikube's Docker daemon:
   ```bash
   eval $(minikube -p minikube docker-env)

### Step 2: Build Docker Image

The NGINX image will be built locally within Minikube's Docker environment.

1. Clone this repository:
   ```bash
   git clone https://github.com/toobababar/Nginx-server-K8s-Pods.git
   cd Nginx-Server-Project

2. Build the Docker image:
   ```bash
   docker build -t nginx-k8s .

This command will create a Docker image named nginx-k8s.

### Step 3: Deploy the NGINX Pod:

Deploy the NGINX container to a Kubernetes pod using the following command:

1. Apply the Kubernetes deployment configuration file:
   ```bash
   kubectl apply -f nginx-deployment.yaml

2. Verify that the deployment and pods are running:
   ```bash
   kubectl get deployments
   kubectl get pods

### Step 4: Expose the deployment:

Expose the running NGINX deployment as a service using NodePort to allow external access:
```bash
kubectl expose deployment nginx-deployment --type=NodePort --port=80


You can verify that the service was created by running:

```bash
kubectl get services


### ^*Step 5: Access the NGINX Server:**

You can access the service using Minikube’s IP and the assigned NodePort.

1. Get Minikube's IP address:
```bash
minikube ip

2. Check the port on which the service is exposed (e.g., 30008):
```bash
kubectl get services

3. Access the NGINX service in your browser:
```php
http://<minikube-ip>:<node-port>

Alternatively, you can use the following command to automatically open the service in your browser:
```bash
minikube service nginx-deployment

## Project Files

Here are the key files included in this project:

1. Dockerfile: This file contains instructions to build the custom NGINX Docker image.
2. nginx-deployment.yaml: Kubernetes deployment configuration for running the NGINX pod.
3. index.html: This file contains content to serve as a webpage.
4. README.md: Detailed instructions for setting up and running the project.

## Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Docker Documentation](https://docs.docker.com/)



