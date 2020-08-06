#!/usr/bin/env bash


if [ ! -d "atte/saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111" ]; then
  mkdir atte/saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111 -p
fi

if [ ! -f atte/saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111/best_accuracy.pth ]; then
    echo 'Download  best_accuracy.pth ......'
    cd atte/saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111/
    wget https://dikers-public.s3.cn-northwest-1.amazonaws.com.cn/model/ocr/best_accuracy.pth
    cd -
fi



if [ ! -d 'craft/weights' ]; then
    mkdir -p craft/weights
fi

if [ ! -f craft/weights/craft_mlt_25k.pth ]; then
    echo 'Download  craft_mlt_25k.pth ......'
    cd craft/weights
    wget https://dikers-public.s3.cn-northwest-1.amazonaws.com.cn/model/ocr/craft_mlt_25k.pth
    cd -
fi


export PYTHONPATH=./

python3 ocr_main.py  \
-i 'sample_data/images/' \
-o 'output/' \
--cuda==False  \
--batch_size 64 \
--label_file_list  'sample_data/chars.txt' \
--Transformation TPS --FeatureExtraction ResNet --SequenceModeling BiLSTM --Prediction Attn \
--saved_model atte/saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111/best_accuracy.pth \
--trained_model craft/weights/craft_mlt_25k.pth