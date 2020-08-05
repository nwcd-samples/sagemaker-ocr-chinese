# sagemaker-ocr-chinese
使用Sagemaker 实现中文ocr模型的训练，并部署为Web服务。


## 使用Sagemaker 



### 训练

[sagemaker/01-train/train.ipynb](./sagemaker/01-train/train.ipynb)


## 部署

[sagemaker/02-inference/inference.ipynb](./sagemaker/02-inference/inference.ipynb)



## 本地环境

### 测试

```
conda create -n  ocr python=3.6
source activate ocr
pip install -r requirements.txt -i https://mirrors.163.com/pypi/simple/ 


cd local
sh ocr_main.sh

```


### 训练

需要准备训练数据， 请参考[ocr-text-renderer 中文文字图片生成](https://github.com/dikers/ocr-text-renderer)


```
cd local/data_generate/
sh create_lmdb.sh

cd ../atte
sh run.sh

```