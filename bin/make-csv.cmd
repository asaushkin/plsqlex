cat common.log  | grep -v \-\-\- | grep -v ===== | grep -v Process > common.csv
start excel common.csv
