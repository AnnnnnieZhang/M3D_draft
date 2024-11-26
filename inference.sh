#!/bin/bash
#PBS -q gpu
#PBS -A SSR  # 指定账户组
#PBS -l elapstim_req=01:00:00  # 设置时间限制为1小时
#PBS -N ssr  # 任务名称
#PBS -o output.log  # 输出文件
#PBS -e error.log   # 错误日志

# 切换到工作目录
cd /work/SSR/luoxi/SSR-compare

# 激活虚拟环境
source /home/SSR/luoxi/miniconda3/bin/activate mamba
# python -c "import timm; print('timm successfully imported')"

# 加载需要的模块
module load cuda/12.4
module load pytorch

# 在这里运行GPU计算程序，例如Python脚本
python inference_rot_angle.py --config configs/train_front3d_fusion.yaml

