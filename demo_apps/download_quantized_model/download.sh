#!/bin/bash
# command for downloading the model from
# https://drive.google.com/file/d/1afPv3HOy73BE2MoYCgYJvBDeQNa9rZbj/view?usp=sharing
# file is large and therefore requires the following command

FILEID=1afPv3HOy73BE2MoYCgYJvBDeQNa9rZbj
FILENAME=ggml-model-q4_0.gguf
CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=$FILEID" | grep -o 'confirm=[^&]*' | sed 's/confirm=//')
wget --load-cookies /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=$CONFIRM&id=$FILEID" -O $FILENAME
rm -rf /tmp/gcookie