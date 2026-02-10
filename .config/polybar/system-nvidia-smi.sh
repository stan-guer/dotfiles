#!/bin/sh

GPU_INFO=$(nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader 2>/dev/null)

if [ $? -eq 0 ] && [ -n "$GPU_INFO" ]; then
    echo "GPU $GPU_INFO"
else
    echo "GPU ERR"
fi
