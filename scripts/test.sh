#!/bin/bash

MODEL=1
if [ $# > 1 ]; then
    MODEL=$1
fi

if [ $MODEL -eq 1 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../mmpose/projects/rtmpose/rtmpose/body_2d_keypoint/rtmpose-m_8xb256-420e_coco-256x192.py
    MODEL=datas/deploy_models/rtmpose-trt/rtmpose-m/end2end.engine
    WORK_DIR=datas/outputs/rtmpose-trt/rtmpose-m

elif [ $MODEL -eq 2 ]; then
    DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_static-320x320.py
    MODEL_CFG=../mmpose/demo/mmdetection_cfg/rtmdet_nano_320-8xb32_coco-person.py
    MODEL=datas/deploy_models/rtmdet-trt/rtmdet-n/end2end.engine
    WORK_DIR=datas/outputs/rtmdet-trt/rtmdet-n

elif [ $MODEL -eq 3 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../mmpose/configs/body_2d_keypoint/rtmo/body7/rtmo-t_8xb32-600e_body7-416x416.py
    MODEL=datas/deploy_models/rtmo-trt/rtmo-t/end2end.engine
    WORK_DIR=datas/outputs/rtmo-trt/rtmo-t

elif [ $MODEL -eq 4 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/golfpose/v1/rtmo-t_golfpose-416x416.py
    MODEL=../GolfPose/models/bottomup/golfpose/v1/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmo-trt/rtmo-t

elif [ $MODEL -eq 5 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/golfclub/v0/rtmo-t_golfclub-416x416.py
    MODEL=../GolfPose/models/bottomup/golfclub/v0/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmo-trt/rtmo-t

elif [ $MODEL -eq 6 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/halpe28/v0/rtmo-t_halpe28-416x416.py
    MODEL=../GolfPose/models/bottomup/halpe28/v0/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmo-trt/rtmo-t

elif [ $MODEL -eq 7 ]; then
    DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_dynamic-640x640.py
    MODEL_CFG=../GolfPose/models/topdown/golfdet/v1/rtmdet_tiny_8xb32-300e_golfpose.py
    MODEL=../GolfPose/models/topdown/golfdet/v1/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmdet-trt/rtmdet-t

elif [ $MODEL -eq 8 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../GolfPose/models/topdown/golfpose/v3/rtmpose-m_golfpose-256x192.py
    MODEL=../GolfPose/models/topdown/golfpose/v3/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmpose-trt/rtmpose

elif [ $MODEL -eq 9 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../GolfPose/models/topdown/halpe28/v0/rtmpose-m_halpe28-256x192.py
    MODEL=../GolfPose/models/topdown/halpe28/v0/tensorrt/end2end.engine
    WORK_DIR=datas/outputs/rtmpose-trt/rtmpose

else
    echo "Not supported!"
fi

DEVICE=cuda:0

python tools/test.py \
    $DEPLOY_CFG $MODEL_CFG \
    --model $MODEL --device $DEVICE \
    --work-dir $WORK_DIR --batch-size 1 \
    --speed-test --warmup 50 --log-interval 100

