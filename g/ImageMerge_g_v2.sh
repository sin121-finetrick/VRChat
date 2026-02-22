#!/bin/bash

# 設定
inputDirectory='D:\Users\shinichi\Documents\GitHub\VRChat\g\src\'
outputDirectory='D:\Users\shinichi\Documents\GitHub\VRChat\g\'
tile_size=16 # 4x4のタイル

cd "$inputDirectory" || exit

# ファイル一覧を取得（逆順）
files=( $(ls -r) )
total_files=${#files[@]}
# 作成されるべき総タイル数を計算
total_tiles=$(( (total_files + tile_size - 1) / tile_size ))

echo "Total files: $total_files"
echo "Total tiles to create: $total_tiles"
echo "----------------------------------------"

tile_index=0
for (( i=0; i<$total_files; i+=$tile_size )); do
    # 16枚分（または残り全分）を配列から取り出す
    batch=("${files[@]:i:tile_size}")
    
    # 進捗表示（例：[1/50] Processing...）
    current_tile=$((tile_index + 1))
    echo "[$current_tile/$total_tiles] Generating tile: output_tile_${tile_index}.jpg"

    # 16枚だけでmontageを実行（-monitorは不要になります）
    montage "${batch[@]}" -geometry 512x512+0+0 -tile 4x4 "${outputDirectory}output_tile_${tile_index}.jpg"
    
    ((tile_index++))
done

echo "----------------------------------------"
echo "すべての処理が完了しました。"

# キー入力を待機する設定
read -p "何かキーを押すとウィンドウを閉じます..."