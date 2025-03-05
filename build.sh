#!/bin/bash

# Navigate to eazybytes directory (optional if the script is already there)
cd "$(dirname "$0")"

# Function to build a project using Maven
build_project() {
    echo "Building project: $1"
    cd $1
    mvn clean install -Dmaven.test.skip=true
    if [ $? -ne 0 ]; then
        echo "Build failed for project: $1"
        exit 1
    fi
    echo "Build succeeded for project: $1"
    cd ..
}

# Build all the projects
build_project "accounts"
build_project "loans"
build_project "cards"
build_project "configserver"
build_project "eurekaserver"

echo "All projects have been built successfully!"

# Build all images
./build-images

# Remove none tag images
docker images -q --filter "dangling=true" | xargs docker rmi

# Run docker-compose launch the container
./build-compose up default
