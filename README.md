# sagemaker-ocr-chinese
使用Sagemaker 实现中文ocr模型的训练，并部署为Web服务。


## 使用Sagemaker 进行训练

[sagemaker](./sagemaker)



## 本地训练

```
conda create -n  ocr python=3.6
source activate ocr
pip install -r requirements.txt -i https://mirrors.163.com/pypi/simple/  --default-timeout=3000


cd local
sh ocr_main.sh

```
