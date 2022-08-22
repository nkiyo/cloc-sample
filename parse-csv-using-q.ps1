# -d ",": カンマを区切り文字に使用
# -H: ヘッダのあるCSVという意味
# -O: ヘッダを出力する
# -T: タブ区切りで出力する

$pre = "7ad2c1"
$post = "d468b6"

$csv = $(cloc --diff $pre $post --csv --by-file --quiet) 
$csv | q -d "," -H -O -T 'SELECT "File", `== blank`, `+ blank` FROM - ;'
