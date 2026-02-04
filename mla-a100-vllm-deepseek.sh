#!/bin/bash

pip install --upgrade pip
pip install vllm flash-attn --no-build-isolation

echo "正在安装 vLLM..."
pip install vllm

python -m vllm.entrypoints.openai.api_server \
    --model Qwen/Qwen2-0.5B-Instruct \
    --trust-remote-code \
    --gpu-memory-utilization 0.9 \
    --max-model-len 4096 \
    --dtype half \
    --host 0.0.0.0 \
    --port 8000

