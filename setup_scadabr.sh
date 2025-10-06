#!/bin/bash

set -e

echo "🔧 Starting ScadaBR environment setup..."

# Update package lists
echo "📦 Updating package list..."
sudo apt update

# Install Java 8
echo "☕ Installing OpenJDK 8..."
sudo apt install -y openjdk-8-jdk

# Install Git
echo "🐙 Installing Git..."
sudo apt install -y git

# Install Docker
echo "🐳 Installing Docker..."
if ! command -v docker &> /dev/null; then
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
fi

# Enable Docker service
echo "🔄 Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to Docker group (optional)
if groups $USER | grep &>/dev/null '\bdocker\b'; then
    echo "👤 User already in docker group"
else
    echo "➕ Adding user to docker group (logout and login again to take effect)"
    sudo usermod -aG docker $USER
fi

# Install Docker Compose (if needed)
echo "🔧 Installing Docker Compose..."
sudo apt install -y docker-compose

# Optional: Clone ScadaBR repo and build Docker image
read -p "📥 Do you want to clone the ScadaBR Docker repo and build it now? (y/n): " clone_choice

if [[ "$clone_choice" == "y" || "$clone_choice" == "Y" ]]; then
    git clone https://github.com/Swaraagdinesh/CTF_scadabr-docker.git
    cd CTF_scadabr-docker
    echo "🏗️  Building Docker image..."
    docker build -t scadabr:latest .
    echo "✅ Image 'scadabr:latest' built successfully!"
    echo "💡 Run it with: docker run -it --rm -p 8081:8080 scadabr:latest"
else
    echo "⏭️ Skipping clone and build."
fi

echo "🎉 Setup complete!"
