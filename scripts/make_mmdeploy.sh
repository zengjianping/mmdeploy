#!/bin/bash

PPLCV_DIR=/home/ezgolf/ProjectGolf/Projects/ppl.cv
PROTO_DIR=/home/ezgolf/miniconda3/envs/golfpose

cmake .. \
    -DMMDEPLOY_BUILD_SDK=ON \
    -DMMDEPLOY_BUILD_EXAMPLES=ON \
    -DMMDEPLOY_BUILD_SDK_PYTHON_API=ON \
    -DMMDEPLOY_TARGET_DEVICES="cuda;cpu" \
    -DMMDEPLOY_TARGET_BACKENDS="trt;ort" \
    -Dpplcv_DIR=${PPLCV_DIR}/cuda-build/install/lib/cmake/ppl \
    -DTENSORRT_DIR=${TENSORRT_DIR} \
    -DCUDNN_DIR=${CUDNN_DIR} \
    -DONNXRUNTIME_DIR=${ONNXRUNTIME_DIR} \
    -DProtobuf_LIBRARIES=${PROTO_DIR}/lib/libprotobuf.so \
    -DProtobuf_PROTOC_EXECUTABLE=${PROTO_DIR}/bin/protoc \
    -DProtobuf_INCLUDE_DIR=${PROTO_DIR}/include

