# ScadaBR - Open source SCADA
![ScadaBR logo](https://user-images.githubusercontent.com/82009729/128575518-fcef7deb-9be0-4ef9-8946-5c189a6ac411.png)

Você pode baixar a versão mais atual do ScadaBR [aqui](https://github.com/ScadaBR/ScadaBR/releases/latest).

# ScadaBR - Open Source SCADA with Docker Support

[![Docker](https://img.shields.io/badge/docker-ready-blue)](https://www.docker.com/)

This repository provides a **Dockerized version of ScadaBR**, an open-source SCADA (Supervisory Control and Data Acquisition) software system.

---

## 🚀 Quick Start (Using Docker)

> Ensure [Docker is installed](https://docs.docker.com/get-docker/) on your system.

### 1. Clone this repository

```bash
git clone https://github.com/Swaraagdinesh/CTF_scadabr-docker.git
cd CTF_scadabr-docker

2. Build the Docker image

docker build -t scadabr:latest .

3. Run the container

docker run -it --rm -p 8081:8080 scadabr:latest

4. Open in browser

Visit: http://localhost:8081/ScadaBR
📦 What's Included

This repository contains:

    Full ScadaBR source code

    A Dockerfile to containerize the application

    Necessary scripts and configuration files

📖 About ScadaBR

ScadaBR is an open-source SCADA system offering features like:

    📡 Data acquisition over 20+ protocols (Modbus, OPC, DNP3, IEC, etc.)

    📊 Real-time data visualization

    🎛️ HMI screen building

    🚨 Configurable alarms and events

    🌐 Browser-based access

    🔧 Scripting engine for automation and logic

    ScadaBR is open source and 100% free. The only limit is your creativity.

🛠 Manual Installation (Non-Docker)

For advanced users or alternative environments:

    Install Java 8 (or OpenJDK 8)

    Install Tomcat 9

    Download the latest ScadaBR .war release

    Extract and place contents inside Tomcat's webapps/ directory

    Restart Tomcat

💡 Default database is Apache Derby. To use MySQL/MariaDB:

    Edit: WEB-INF/classes/env.properties

    Add your JDBC Connector to the classpath

🧪 System Requirements

    Java 8 / OpenJDK 8

    Apache Tomcat 9

    OS: Any system that supports Java (Linux, Windows, macOS)

📚 Resources

    🧠 ScadaBR Forum

📺 ScadaBR YouTube Channel

🌐 Official ScadaBR Website

