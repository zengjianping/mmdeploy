#!/bin/bash

MODEL=datas/deploy_models/rtmpose-trt/rtmpose-m
#MODEL=datas/deploy_models/rtmo-trt/rtmo-t
DEVICE=cuda
IMAGE=demo/resources/human-pose.jpg

python demo/python/pose_detection.py \
    $DEVICE $MODEL $IMAGE
