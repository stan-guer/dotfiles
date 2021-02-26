#!/bin/sh

echo "GPU $(nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader)"
