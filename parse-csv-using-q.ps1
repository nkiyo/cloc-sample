# -d ",": カンマを区切り文字に使用
# -H: ヘッダのあるCSVという意味
# -O: ヘッダを出力する
# -T: タブ区切りで出力する

$pre = "7ad2c1"
$post = "d468b6"

$csv = $(cloc --diff $pre $post --csv --by-file --quiet) 
#$csv
#$csv | q -d "," -H -O -T 'SELECT `File`, `!= code`, `+ code`, `- code` FROM - ;'
#$csv | q -d "," -H -T 'SELECT SUM(`!= code` + `+ code` + `- code`) FROM - ;'
$csv | q -d "," -H -T 'SELECT SUM(`!= code`), SUM(`+ code`), SUM(`- code`) FROM - ;'
# TODO tab区切りの3つの値を、変数に展開する方法？
