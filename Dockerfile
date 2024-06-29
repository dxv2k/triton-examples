FROM nvcr.io/nvidia/tritonserver:24.05-python-py3

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    wget \
    cmake \
    git \
    build-essential \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# add latest version of vLLM 
RUN pip install vllm==0.5.0 & \
    mkdir -p /opt/tritonserver/backends/vllm && \
    wget -P /opt/tritonserver/backends/vllm https://raw.githubusercontent.com/triton-inference-server/vllm_backend/main/src/model.py


WORKDIR /work

COPY . /work
