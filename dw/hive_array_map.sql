data
----
Name1,ph1,bar1#foo1,type:1000#color:3,SanRamon#ca#94583
Name2,ph1,bar2#foo2,type:2000#color:4,Columbus#oh#45632
Name3,ph1,bar3#foo3,type:3000#color:5,Windsor#ct#09381
Name4,ph2,111810027456506994609359#132510045614020795201932,type:4000#color:6,Phoenix#az#34567


drop table sam_arr;

create external table sam_arr(  
name string,
ph string,
category ARRAY<STRING>,
shape MAP<STRING,INT>,
addr STRUCT<city:STRING,state:STRING,zip:INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '#'
MAP KEYS TERMINATED BY ':'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/inn81545/ETL/ARR';

select name,ph,category[1],category[0],shape["color"],shape["type"],addr.zip,addr.state from sam_arr


Name1	ph1	foo1	bar1	3	1000	94583	ca
Name2	ph1	foo2	bar2	4	2000	45632	oh
Name3	ph1	foo3	bar3	5	3000	9381	ct
Name4	ph2	132510045614020795201932	111810027456506994609359	6	4000	34567	az



Refer http://bigdatariding.blogspot.com/2014/02/hive-complex-data-types-with-examples.html
