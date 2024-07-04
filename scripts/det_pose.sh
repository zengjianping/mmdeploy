#!/bin/bash

DET_MODEL=datas/deploy_models/rtmdet-trt/rtmdet-n
POSE_MODEL=datas/deploy_models/rtmpose-trt/rtmpose-m
DEVICE=cuda
IMAGE=demo/resources/human-pose.jpg

python demo/python/det_pose.py \
    $DEVICE $DET_MODEL $POSE_MODEL $IMAGE
