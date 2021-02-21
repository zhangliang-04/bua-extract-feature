# 环境配置
经过多次实验的环境配置如下：
- python==3.7.6 （3.6.0安装pytorch时会报错）
- torch==1.4.0 （1.5.0与某些版本cuda在安装detectron2或apex时会有问题）
- cuda==10.0

需要先安装正确版本的torch、opencv
```
pip install torch==1.4.0+cu100 torchvision==0.5.0+cu100 -f https://download.pytorch.org/whl/torch_stable.html
# torch官网没有给1.4.0和cuda10.0的安装方式 但是加上+cu100是有这个版本的
pip install opencv-python

```
接下来follow[README.md](README.md)中的setup即可
#### Installation

1. Clone the project including the required version (v0.2.1) of Detectron2
   ```bash
   # clone the repository inclduing Detectron2(@be792b9) 
   $ git clone --recursive https://github.com/zhangliang-04/bua-extract-feature.git
   ```
   
2. Install Detectron2
   ```bash
   $ cd detectron2
   $ pip install -e .
   $ cd ..
   ```
**We recommend using Detectron2 v0.2.1 (@be792b9) as backend for this project, which has been cloned in step 1. We believe a newer Detectron2 version is also compatible with this project unless their interface has been changed (we have tested v0.3 with PyTorch 1.5).**
   
3. Compile the rest tools using the following script:

   ```bash
   # install apex
   $ git clone https://github.com/NVIDIA/apex.git
   $ cd apex
   $ python setup.py install
   $ cd ..
   # install the rest modules
   $ python setup.py build develop
   $ pip install ray
   ```

在保证cuda版本一致的情况下 可以直接复制其他机器上配好的conda环境到本地的conda envs目录下
```
# 请根据conda环境地址和环境名更改
scp -r ~/miniconda2/envs/bua target_ip:~/miniconda2/envs/
source activate bua # 老版本conda
conda activate bua # 较新版本conda
```
激活环境后 torch 和 apex 就没有问题了，但是需要重新对detectron2和bua进行编译，执行：
```
   # 编译detectron2
   cd detectron2
   pip install -e .
   cd ..
   # 编译bua
   python setup.py build develop
   pip install ray
```
`extract_features_faster.py`比`extract_features.py`快 \
注意使用`extract_features_faster.py`提取特征时，使用的cpu:gpu数量为8:1，否则会影响速度，详见[这里](https://github.com/MILVLG/bottom-up-attention.pytorch/pull/41) \
根据需要修改[utils/extract_utils.py](utils/extract_utils.py) 调整保存特征的内容和格式.

增加了`--image-list`参数 按图片路径`list`提取特征 输入是`json`格式的`list`