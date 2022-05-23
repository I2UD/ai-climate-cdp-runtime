# Specify an ML Runtime base image
FROM docker.repository.cloudera.com/cloudera/cdsw/ml-runtime-workbench-python3.9-cuda:2022.04.1-b6

# Install system packages in the new image
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgl1 \
    libproj-dev \
    libspatialindex-dev \
    proj-bin \
    python3-dev \
    python3-venv \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Upgrade packages in the base image
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install the python package sklearn
#RUN pip install --no-cache-dir sklearn

# Override Runtime label and environment variables metadata
ENV ML_RUNTIME_EDITION="AI Climate NVIDIA GPU" \
    ML_RUNTIME_SHORT_VERSION="0.1" \
    ML_RUNTIME_MAINTENANCE_VERSION=0 \
    ML_RUNTIME_DESCRIPTION="This runtime includes support for NVIDIA CUDA, GDAL, OGR and other packages used by the AI Climate solution"

ENV ML_RUNTIME_FULL_VERSION="${ML_RUNTIME_SHORT_VERSION}.${ML_RUNTIME_MAINTENANCE_VERSION}"

LABEL com.cloudera.ml.runtime.edition=$ML_RUNTIME_EDITION \
      com.cloudera.ml.runtime.full-version=$ML_RUNTIME_FULL_VERSION \
      com.cloudera.ml.runtime.short-version=$ML_RUNTIME_SHORT_VERSION \
      com.cloudera.ml.runtime.maintenance-version=$ML_RUNTIME_MAINTENANCE_VERSION \
      com.cloudera.ml.runtime.description=$ML_RUNTIME_DESCRIPTION
