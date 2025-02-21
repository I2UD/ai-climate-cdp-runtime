# AI Climate CDP Runtime

Cloudera Runtime Docker image for the AI Climate Platform.

## Table of Contents
- [Overview](#overview)
- [Installation & Setup](#installation--setup)
  - [Prerequisites](#prerequisites)
  - [Building the Docker Image](#building-the-docker-image)
  - [Running the Container](#running-the-container)
  - [Pushing the Image](#pushing-the-image)
- [Development](#development)
  - [Code Structure](#code-structure)
  - [Dependencies](#dependencies)
  - [Configuration](#configuration)
  - [Testing](#testing)
  - [Development Workflow](#development-workflow)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
This repository provides a **Cloudera Runtime Docker image** for AI Climate applications. It includes a `Dockerfile` for containerization, a `Makefile` for automating builds and deployments, and a `requirements.txt` file that lists Python dependencies.

---

## Installation & Setup

### Prerequisites
Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/) (optional but recommended)
- Python (if running dependencies locally)

### Building the Docker Image
You can build the Docker image using **Make**:
```sh
make build
```
Alternatively, you can build it manually using Docker:
```sh
docker build --rm -t dymaxionlabs/ai-climate-cdp-runtime .
```

### Running the Container
Once built, run the container with:
```sh
docker run -it dymaxionlabs/ai-climate-cdp-runtime
```
If you need to mount local directories for development, use:
```sh
docker run -it -v $(pwd):/app dymaxionlabs/ai-climate-cdp-runtime
```

### Pushing the Image
If you want to push the image to a Docker registry, use:
```sh
make push
```
or manually:
```sh
docker push dymaxionlabs/ai-climate-cdp-runtime
```

---

## Development

### Code Structure
The repository consists of the following files:
- `Dockerfile`: Defines the Docker image, including base image and dependencies.
- `Makefile`: Contains shortcuts for building, running, and pushing the image.
- `requirements.txt`: Lists Python dependencies for the environment.
- `LICENSE`: Specifies the open-source license used for this project.
- `README.md`: This documentation file.

### Dependencies
The required Python libraries are listed in `requirements.txt`:
```
pysatproc==0.1.9
unetseg==0.2.2
```
To install them manually in a local environment:
```sh
pip install -r requirements.txt
```

### Configuration
Configuration parameters can be set using **environment variables** inside the container.
To pass environment variables at runtime, use:
```sh
docker run -e ENV_VAR_NAME=value dymaxionlabs/ai-climate-cdp-runtime
```
You can also create a `.env` file and pass it to Docker:
```sh
docker run --env-file .env dymaxionlabs/ai-climate-cdp-runtime
```

### Testing
To ensure that everything is working correctly, you can run:
```sh
docker run --rm dymaxionlabs/ai-climate-cdp-runtime pytest
```
If there are test scripts available, consider adding them under a `/tests` directory and linking it in the `Dockerfile`.

### Development Workflow
1. Clone the repository:
   ```sh
   git clone https://github.com/dymaxionlabs/ai-climate-cdp-runtime.git
   cd ai-climate-cdp-runtime
   ```
2. Set up dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Modify code or configurations as needed.
4. Build the Docker image:
   ```sh
   make build
   ```
5. Run and test changes:
   ```sh
   docker run -it dymaxionlabs/ai-climate-cdp-runtime
   ```
6. Push the updated image if required:
   ```sh
   make push
   ```

---

## Contributing
Contributions are welcome! If you'd like to report issues or submit a pull request, visit the [GitHub issues page](https://github.com/dymaxionlabs/ai-climate-cdp-runtime).

Please follow the [Contributor Covenant](http://contributor-covenant.org) code of conduct for respectful collaboration.

---

## License
This project is licensed under the **Apache 2.0 License**. See the [LICENSE](https://github.com/dymaxionlabs/ai-climate-cdp-runtime/blob/main/LICENSE) file for details.
