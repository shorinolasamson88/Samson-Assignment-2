Dockerized Diagnostic CLI
Overview

This project is a simple diagnostic command-line tool built with Bash and packaged using Docker. The goal of the project is to take a Linux diagnostic script and run it inside a container so that it can work consistently on different systems.

The tool provides commands for checking:

System information
Network connectivity
Disk usage
Help and usage information

The application is containerized using Docker and can also be run using Docker Compose.

Project Structure
assignment-2/
├── README.md
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── grade.sh
├── test.sh
└── app/
    ├── diagnostic.sh
    └── health-check.sh

Requirements:

Before running this project, make sure the following are installed:

Docker
Docker Compose

An internet connection is required when building the image for the first time because Docker needs to download the base image and install the required packages from Docker Hub and Alpine repositories.

Building the Image

Build the Docker image using:

docker build -t diagnostic-tool .

Running the Application:

Display system information
docker run --rm diagnostic-tool system

Display disk information
docker run --rm diagnostic-tool disk

Check network connectivity
docker run --rm diagnostic-tool network google.com

You can also use an IP address:

docker run --rm diagnostic-tool network 8.8.8.8

Display help information
docker run --rm diagnostic-tool help

Invalid Commands

Invalid commands and missing arguments are handled properly by the application.

Example:

docker run --rm diagnostic-tool invalid

The tool returns exit code 2 for invalid input.

Running with Docker Compose

Run commands using Docker Compose:

docker compose run --rm diagnostic system

Examples:

docker compose run --rm diagnostic disk

docker compose run --rm diagnostic help

docker compose run --rm diagnostic network google.com

Running Tests

Run the student test script:

./test.sh

Run the grading script:

./grade.sh

Exit Codes:
Exit Code	   Meaning
    0	   Successful execution
    1	   Operational or runtime failure
    2	   Invalid command or invalid input

Assumptions:
Docker and Docker Compose are installed.
Internet access is available when building the image for the first time.
The network command depends on DNS resolution and network connectivity.
Scripts have executable permissions before running:
chmod +x grade.sh test.sh app/*.sh

Author

Shorinola Samson Oladimeji