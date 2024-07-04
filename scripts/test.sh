#!/bin/bash

DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
MODEL_CFG=../mmpose/projects/rtmpose/rtmpose/body_2d_keypoint/rtmpose-m_8xb256-420e_coco-256x192.py
MODEL=datas/deploy_models/rtmpose-trt/rtmpose-m/end2end.engine
WORK_DIR=datas/outputs/rtmpose-trt/rtmpose-m

DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_static-320x320.py
MODEL_CFG=../mmpose/demo/mmdetection_cfg/rtmdet_nano_320-8xb32_coco-person.py
MODEL=datas/deploy_models/rtmdet-trt/rtmdet-n/end2end.engine
WORK_DIR=datas/outputs/rtmdet-trt/rtmdet-n

DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
MODEL_CFG=../mmpose/configs/body_2d_keypoint/rtmo/body7/rtmo-t_8xb32-600e_body7-416x416.py
MODEL=datas/deploy_models/rtmo-trt/rtmo-t/end2end.engine
WORK_DIR=datas/outputs/rtmo-trt/rtmo-t

DEVICE=cuda:0

python tools/test.py \
    $DEPLOY_CFG $MODEL_CFG \
    --model $MODEL --device $DEVICE \
    --work-dir $WORK_DIR --batch-size 1 \
    --speed-test --warmup 50 --log-interval 100

