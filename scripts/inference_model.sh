#!/bin/bash

DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
MODEL_CFG=../mmpose/projects/rtmpose/rtmpose/body_2d_keypoint/rtmpose-m_8xb256-420e_coco-256x192.py
#MODEL=https://download.openmmlab.com/mmpose/v1/projects/rtmposev1/rtmpose-m_simcc-aic-coco_pt-aic-coco_420e-256x192-63eb25f7_20230126.pth
MODEL=datas/deploy_models/rtmpose-trt/rtmpose-m/end2end.engine

DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_static-320x320.py
MODEL_CFG=../mmpose/demo/mmdetection_cfg/rtmdet_nano_320-8xb32_coco-person.py
#MODEL=https://download.openmmlab.com/mmpose/v1/projects/rtmpose/rtmdet_nano_8xb32-100e_coco-obj365-person-05d8511e.pth
MODEL=datas/deploy_models/rtmdet-trt/rtmdet-n/end2end.engine

DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
MODEL_CFG=../mmpose/configs/body_2d_keypoint/rtmo/body7/rtmo-t_8xb32-600e_body7-416x416.py
#MODEL=https://download.openmmlab.com/mmpose/v1/projects/rtmo/rtmo-t_8xb32-600e_body7-416x416-f48f75cb_20231219.pth
MODEL=datas/deploy_models/rtmo-trt/rtmo-t/end2end.engine

IMAGE_PATH=demo/resources/human-pose.jpg
DEVICE=cuda:0

python tools/inference_model.py \
    $DEPLOY_CFG $MODEL_CFG $IMAGE_PATH \
    --model $MODEL --device $DEVICE
