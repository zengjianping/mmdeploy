# Copyright (c) OpenMMLab. All rights reserved.
import argparse
import glob
import os.path as osp
from mmdeploy.apis import inference_model


def parse_args():
    parser = argparse.ArgumentParser(
        description='MMDeploy Model Inference Tool.')
    parser.add_argument('deploy_cfg', help='Deploy config path')
    parser.add_argument('model_cfg', help='Model config path')
    parser.add_argument('image_path', help='Input image file or directory')
    parser.add_argument(
        '--model', type=str, nargs='+', help='Input model files.')
    parser.add_argument(
        '--device', help='device type for inference', default='cuda:0')
    parser.add_argument(
        '--batch-size', type=int, default=1, help='the batch size for test.')
    args = parser.parse_args()
    return args


def get_images(image_dir, extensions):
    images = []
    files = glob.glob(osp.join(image_dir, '**', '*'), recursive=True)
    for f in files:
        _, ext = osp.splitext(f)
        if ext.lower() in extensions:
            images.append(f)
    return images

def main():
    args = parse_args()
    print(args)

    result = inference_model(
        model_cfg=args.model_cfg,
        deploy_cfg=args.deploy_cfg,
        backend_files=args.model,
        img=args.image_path,
        device=args.device)

    print(result)

if __name__ == '__main__':
    main()
