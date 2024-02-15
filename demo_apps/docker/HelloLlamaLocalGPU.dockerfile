#12.3.0-devel-ubuntu22.04 
#11.6.1-devel-ubuntu20.04
ARG TAG=11.8.0-devel-ubuntu20.04
FROM nvidia/cuda:${TAG}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3.10 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install jupyterlab

RUN CMAKE_ARGS="-DLLAMA_CUBLAS=on" \
    FORCE_CMAKE=1 \
    pip install llama-cpp-python \
    && pip install pypdf sentence-transformers chromadb langchain

ENV PORT_JNB=8888
ENV WORKSPACE_DIR=/workspace
# make alias for jupyter lab
RUN echo "alias jlab='jupyter lab --ip=0.0.0.0 --port=${PORT_JNB} --notebook-dir=${WORKSPACE_DIR} --allow-root --no-browser'" >> ~/.bashrc