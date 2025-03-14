#!/bin/bash

install_requirements(){
    echo "Install Deps."
    sudo apt-get update
    sudo apt-get install docker.io nginx -y docker-compose
}

required_restarts(){
    sudo chown $USER /var/run/docker.sock
    sudo systemctl enable docker
    sudo systemctl enable nginx
    sudo systemctl restart docker
    sudo systemctl restart nginx
    sudo usermod -aG docker $USER
}

deploy_app(){
    echo "Building Docker image..."
    if ! docker build -t notes-app .; then
        echo "Docker build failed"
        exit 1
    fi

    echo "Running Docker container..."
    if ! docker-compose up -d; then
        echo "Failed to start container"
        exit 1
    fi
}

echo "*********DEPLOYMENT STARTED**********"

if [ -d "django-notes-app" ]; then
    echo "The code directory already exists"
    cd django-notes-app || exit 1
else
    echo "Cloning repository..."
    git clone https://github.com/LondheShubham153/django-notes-app.git
    cd django-notes-app || exit 1
fi

install_requirements
required_restarts
deploy_app

echo "Checking running containers..."
docker ps -a

echo "*********DEPLOYMENT DONE**************"

