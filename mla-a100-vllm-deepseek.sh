#!/bin/bash

pip install --upgrade pip
pip uninstall -y numpy
pip install "numpy<2.0.0" vllm flash-attn --no-build-isolation

# 访问 FlashAttention 的 GitHub Releases 页面找到对应 CUDA 和 Torch 版本的链接
# 或者尝试强制寻找预编译包：
pip install flash-attn --no-build-isolation --prefer-binary

echo "正在安装 vLLM..."
pip install vllm

export VLLM_USE_PRECOMPILED=1
export VLLM_LOGGING_LEVEL=DEBUG
export RAY_LOG_TO_STDERR=1

python -m vllm.entrypoints.openai.api_server \
    --model deepseek-ai/DeepSeek-V2-Lite-Chat \
    --trust-remote-code \
    --gpu-memory-utilization 0.9 \
    --max-model-len 4096 \
    --dtype bfloat16 \
    --host 0.0.0.0 \
    --port 8000

