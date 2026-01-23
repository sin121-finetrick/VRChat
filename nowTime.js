<script src="time.js">
/**
 * 現在時刻を HH:mm:ss 形式で取得して表示するスクリプト
 */
function displayCurrentTime() {
    const now = new Date();

    // 各項目を2桁の文字列に変換（1桁の場合は先頭に0を付与）
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');

    const timeString = `${hours}:${minutes}:${seconds}`;

    // コンソールに出力
    console.log(timeString);
}

// 実行
displayCurrentTime();
</script>