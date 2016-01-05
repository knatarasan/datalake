drop table sam_arr;

create external table sam_arr(  
name string,
ph string,
category ARRAY<STRING>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '#'
MAP KEYS TERMINATED BY ':'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/inn81545/ETL/ARR';

select name,ph,category[1],category[0] from sam_arr;

Name1	ph1	'bar']	['foo'
Name2	ph1	'bar3']	['foo2'
Name3	ph1	'bar3']	['foo3'


cat data

Name1,ph1,['foo'#'bar']
Name2,ph1,['foo2'#'bar3']
Name3,ph1,['foo3'#'bar3']
