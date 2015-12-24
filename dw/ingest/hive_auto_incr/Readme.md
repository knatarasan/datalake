

1) One of the update script is not working ..
update SCD.DIM_CUSTOMER
set END_DT = (
      select  
      S.START_DT
      from SCD.TMP_DIM_CUSTOMER S JOIN SCD.DIM_CUSTOMER T
      where  S.CUST_NO  = T.CUST_NO
      and S.IND_UPDATE = 'I')
where CUST_NO IN (
      select X.CUST_NO
      from SCD.TMP_DIM_CUSTOMER X
      where  X.IND_UPDATE = 'I')
and END_DT  =   to_date("1999-01-01 00:00:00"); 

I hard coded to (works fine)
/*
update SCD.DIM_CUSTOMER
set END_DT =  from_unixtime(unix_timestamp(),'y-M-d') 
where CUST_NO IN (
      select X.CUST_NO
      from SCD.TMP_DIM_CUSTOMER X
      where  X.IND_UPDATE = 'I')
and END_DT = to_date("1999-01-01 00:00:00");

*/

2) The UDF always generate sequence for particular load , but when you do next load again start from the beginning (1,2.etc)


-----------------------------------------------
row1,c1,c2
row2,c1,c2
row3,c1,c2
row4,c1,c2
row5,c1,c2
row6,c1,c2
row7,c1,c2
row8,c1,c2
row9,c1,c2
row10,c1,c2
                                               
 
 CREATE TABLE t1 (c1 STRING, c2 STRING, c3 STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
 
 LOAD DATA LOCAL INPATH '/home/rajendran/data.csv' OVERWRITE INTO TABLE t1;
 
 SELECT * FROM t1;


 CREATE TABLE increment_table1 (id INT, c1 STRING, c2 STRING, c3 STRING, c4 STRING);

 INSERT OVERWRITE TABLE increment_table1 SELECT incr() AS inc, c1, c2, c3 , 'Extra col' FROM t1;

 SELECT * FROM increment_table1;
