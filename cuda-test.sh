#!/bin/bash

ldconfig
cd /tmp
export GIT_COMMITTER_NAME=giofontana
export GIT_COMMITTER_EMAIL=giov.fontana@gmail.com
git clone https://github.com/NVIDIA/cuda-samples.git
cd cuda-samples/Samples/vectorAdd_nvrtc
make
cd ../../bin/x86_64/linux/release
nvidia-smi && ./vectorAdd
