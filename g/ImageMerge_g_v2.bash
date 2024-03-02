#!/bin/bash

# srcディレクトリに移動し
# ../ImageMerge_g_v2.bash
# 上記コマンドを実行

# ソート対象のディレクトリ
inputDirectory='D:\Users\shinichi\Documents\GitHub\VRChat\g\src\'

# 出力ディレクトリ
outputDirectory='D:\Users\shinichi\Documents\GitHub\VRChat\g\'

# ソートして処理する
sortedFiles=$(ls -r $inputDirectory)

# montageコマンドを実行
montage $sortedFiles -geometry 512x512+0+0 -tile 8x8 $outputDirectory/output_tile_%d.jpg