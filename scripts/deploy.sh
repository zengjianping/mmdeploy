#!/bin/bash

MODEL=1
if [ $# > 1 ]; then
    MODEL=$1
fi

if [ $MODEL -eq 1 ]; then
    #DEPLOY_CFG=configs/mmpose/pose-detection_simcc_onnxruntime_dynamic.py
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../mmpose/projects/rtmpose/rtmpose/body_2d_keypoint/rtmpose-m_8xb256-420e_coco-256x192.py
    CHECKPOINT=https://download.openmmlab.com/mmpose/v1/projects/rtmposev1/rtmpose-m_simcc-aic-coco_pt-aic-coco_420e-256x192-63eb25f7_20230126.pth
    WORK_DIR=datas/deploy_models/rtmpose-trt/rtmpose-m

elif [ $MODEL -eq 2 ]; then
    DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_static-320x320.py
    MODEL_CFG=../mmpose/demo/mmdetection_cfg/rtmdet_nano_320-8xb32_coco-person.py
    CHECKPOINT=https://download.openmmlab.com/mmpose/v1/projects/rtmpose/rtmdet_nano_8xb32-100e_coco-obj365-person-05d8511e.pth
    WORK_DIR=datas/deploy_models/rtmdet-trt/rtmdet-n

elif [ $MODEL -eq 3 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../mmpose/configs/body_2d_keypoint/rtmo/body7/rtmo-t_8xb32-600e_body7-416x416.py
    CHECKPOINT=https://download.openmmlab.com/mmpose/v1/projects/rtmo/rtmo-t_8xb32-600e_body7-416x416-f48f75cb_20231219.pth
    WORK_DIR=datas/deploy_models/rtmo-trt/rtmo-t

elif [ $MODEL -eq 4 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/golfpose/v1/rtmo-t_golfpose-416x416.py
    CHECKPOINT=../GolfPose/models/bottomup/golfpose/v1/epoch_60.pth
    WORK_DIR=../GolfPose/models/bottomup/golfpose/v1/tensorrt

elif [ $MODEL -eq 5 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/golfclub/v0/rtmo-t_golfclub-416x416.py
    CHECKPOINT=../GolfPose/models/bottomup/golfclub/v0/epoch_60.pth
    WORK_DIR=../GolfPose/models/bottomup/golfclub/v0/tensorrt

elif [ $MODEL -eq 6 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_rtmo_tensorrt-fp16_dynamic-416x416.py
    MODEL_CFG=../GolfPose/models/bottomup/halpe28/v0/rtmo-t_halpe28-416x416.py
    CHECKPOINT=../GolfPose/models/bottomup/halpe28/v0/epoch_60.pth
    WORK_DIR=../GolfPose/models/bottomup/halpe28/v0/tensorrt

elif [ $MODEL -eq 7 ]; then
    DEPLOY_CFG=configs/mmdet/detection/detection_tensorrt_dynamic-640x640.py
    MODEL_CFG=../GolfPose/models/topdown/golfdet/v1/rtmdet_tiny_8xb32-300e_golfpose.py
    CHECKPOINT=../GolfPose/models/topdown/golfdet/v1/epoch_100.pth
    WORK_DIR=../GolfPose/models/topdown/golfdet/v1/tensorrt

elif [ $MODEL -eq 8 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../GolfPose/models/topdown/golfpose/v3/rtmpose-m_golfpose-256x192.py
    CHECKPOINT=../GolfPose/models/topdown/golfpose/v3/best_AUC_epoch_100.pth
    WORK_DIR=../GolfPose/models/topdown/golfpose/v3/tensorrt

elif [ $MODEL -eq 9 ]; then
    DEPLOY_CFG=configs/mmpose/pose-detection_simcc_tensorrt_dynamic-256x192.py
    MODEL_CFG=../GolfPose/models/topdown/halpe28/v0/rtmpose-m_halpe28-256x192.py
    CHECKPOINT=../GolfPose/models/topdown/halpe28/v0/best_AUC_epoch_100.pth
    WORK_DIR=../GolfPose/models/topdown/halpe28/v0/tensorrt

else
    echo "Not supported!"
fi

IMAGE=demo/resources/human-pose.jpg
DEVICE=cuda:0

python tools/deploy.py \
    $DEPLOY_CFG $MODEL_CFG $CHECKPOINT $IMAGE \
    --work-dir $WORK_DIR --device $DEVICE \
    --show --dump-info

