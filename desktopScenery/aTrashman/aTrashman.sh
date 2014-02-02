#!/bin/bash
# APP: TrashMan起動・常駐アプリケーション
# ごみ箱を監視し、件数が0件になったらアニメーションを開始する
#
# 変更履歴:
# 	2013.06.03	あらかじめ所定の壁紙(熱帯雨林)に変更する処理を追加 
#
# 前提
# : アニメーションスクリプト(99_changeDesktopPicsByList.scpt)に依存する
# :  files=`echo /Users/tani/Desktop/ATrashman/vid/fireTrash*.jpg | sed -e "s//:/g"`
# :  eval osascript 99_changeDesktopPicsByList.scpt 0.3 $files
# 

# 変数初期化
goFlg=0	# 処理開始フラグ

# 壁紙をセット
files="/Library/Desktop\ Pictures/Plants/Redwoods.jpg"
eval osascript script/99_changeDesktopPicsByList.scpt 1 $files

# アニメーション.scptの利用準備
files=`echo /Users/tani/Desktop/ATrashman/vid/fireTrash*.jpg | sed -e "s/ /:/g"`
script="script/99_changeDesktopPicsByList.scpt 0.1 $files" 

# ごみ箱の検査。0件かどうかを判定する。
while [ $goFlg -eq 0 ] ; do
		itemCnt=`ls ~/.Trash | wc -l`
		# 条件マッチの場合、フラグを立ててループを抜ける
		# 条件アンマッチの場合はスリープして繰り返し
		if [ $itemCnt -eq 0 ]; then
			echo "no trash now burning.."
			goFlg=1
		else 	# 条件アンマッチの場合
			echo "any trash continue watching "
		fi
	sleep 1;
done

# アニメーションを開始する
echo "start the script.."
eval osascript $script

# 終了後、壁紙を戻す
files="/Library/Desktop\ Pictures/Plants/Redwoods.jpg"
eval osascript script/99_changeDesktopPicsByList.scpt 1 $files

# [optional]フラグを倒して始めに戻る
echo "done."

