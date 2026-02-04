#!/bin/bash

pip install --upgrade pip
pip install vllm flash-attn --no-build-isolation

echo "正在安装 vLLM..."
pip install vllm

python -m vllm.entrypoints.openai.api_server \
    --model deepseek-ai/DeepSeek-V2-Lite-Chat \
    --trust-remote-code \
    --gpu-memory-utilization 0.9 \
    --max-model-len 4096 \
    --dtype bfloat16 \
    --host 0.0.0.0 \
    --port 8000

