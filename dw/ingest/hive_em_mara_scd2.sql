#em_mara_snap  is going to contain snapshot of Item table received today
/*
ingest.em_mara_snap	:	will contain today's snapshot of Item data
ingest.em_mara_new 	:	will contain Items which are not present in d_Item
ingest.em_mara_changed 	:	will contain Items which have been in d_Item  , but attributes have changes
*/

/* set sql_safe_updates=0;  */

#--0    Update mara_snap from Item file which arrived today

/* clean up stg tables */
truncate table ingest.em_mara_snap;
truncate table ingest.em_mara_new ;
truncate table ingest.em_mara_changed ;


insert into ingest.em_mara_snap
select
concat('MAT',MATNR),MTART,MBRSH,MATKL,MEINS,BSTME,MAX01,MAX02,MAX03,MAX04,MAX05,MAX06,MAX07,MAX08,MAX09,MAX10,MAX11,
MAX12,MAX13,MAX14,MAX15,MAX16,MAX17,MAX18,MAX19,MAX20,MAX21
FROM `ingest`.`em_mara2` limit 10;

#--1    Prepare dataset of for _new, (i.e, non of source_keys which are present in new available in dimension table 

insert into ingest.em_mara_new 
SELECT MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21
FROM `ingest`.`em_mara_snap` LEFT join dw_sourcing.d_Item item
on
MATNR=item.material_number 
where item.material_number is null;

#--2   Load brand new source keys into dimension table 

insert into dw_sourcing.d_Item
SELECT incr(), MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21,'2015-10-10','2999-12-31'
FROM `ingest`.`em_mara_new`;
#working

#-- changes in source
#--
create table ingest.em_mara_snap2 like em_mara_snap;

insert into ingest.em_mara_snap2
select MATNR,
    concat(MTART,'upd1'),    concat(MBRSH,'upd1'),    concat(MATKL,'upd1'),
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21
from ingest.em_mara_snap
where substr(MATNR,4)> 20000005;

#--3 	Get dimension Item rows which are existing in d_Item but there is change in columns
--  for which history to be maintained (put them into _changed table)


insert into ingest.em_mara_changed 
SELECT AA.MATNR,AA.MTART,AA.MBRSH,AA.MATKL,AA.MEINS,AA.BSTME,AA.MAX01,AA.MAX02,AA.MAX03,AA.MAX04,AA.MAX05,
AA.MAX06,AA.MAX07,AA.MAX08,AA.MAX09,AA.MAX10,AA.MAX11,AA.MAX12,AA.MAX13,AA.MAX14,AA.MAX15,AA.MAX16,AA.MAX17,
AA.MAX18,AA.MAX19,AA.MAX20,AA.MAX21 from
(SELECT MATNR,
    MTART,    MBRSH,    MATKL,
    MEINS,    BSTME,    
    MAX01,    MAX02,
    MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    MAX19,    MAX20,    MAX21,item.material_type,item.industry_sector,item.material_group
FROM `ingest`.`em_mara_snap2` em_mara_snap  inner join dw_sourcing.d_Item item
on
em_mara_snap.MATNR=item.material_number 
where item.eff_to_date='2999-12-31')
AA
where (
AA.MTART<>AA.material_type  or
AA.MBRSH<>AA.industry_sector or
AA.MATKL<>AA.material_group)
;


#-- 4.1 close existing rows

update dw_sourcing.d_Item set eff_to_date='2015-10-11'
where  eff_to_date='2999-12-31' and
 material_number in
(select MATNR from  ingest.em_mara_changed );



#-- 4.2 Insert new rows


insert into dw_sourcing.d_Item
SELECT incr(), chg.*, '2015-10-11','2999-12-31'
FROM `ingest`.`em_mara_changed` chg;



select item_id,material_number,material_type,industry_sector,material_group,base_unit_of_measure,
eff_from_date,eff_to_date
from dw_sourcing.d_Item order by 2;

--------------------Exec log-----------------------------------------------

Detailed Table Information	Table(tableName:em_mara_snap, dbName:ingest, owner:kannappan, createTime:1446439033, lastAccessTime:0, retention:0, sd:StorageDescriptor(cols:[FieldSchema(name:matnr, type:int, comment:null), FieldSchema(name:mtart, type:varchar(50), comment:null), FieldSchema(name:mbrsh, type:varchar(50), comment:null), FieldSchema(name:matkl, type:varchar(20), comment:null), FieldSchema(name:meins, type:varchar(3), comment:null), FieldSchema(name:bstme, type:varchar(3), comment:null), FieldSchema(name:max01, type:varchar(50), comment:null), FieldSchema(name:max02, type:varchar(50), comment:null), FieldSchema(name:max03, type:varchar(50), comment:null), FieldSchema(name:max04, type:varchar(50), comment:null), FieldSchema(name:max05, type:varchar(50), comment:null), FieldSchema(name:max06, type:varchar(50), comment:null), FieldSchema(name:max07, type:varchar(50), comment:null), FieldSchema(name:max08, type:varchar(50), comment:null), FieldSchema(name:max09, type:varchar(50), comment:null), FieldSchema(name:max10, type:varchar(50), comment:null), FieldSchema(name:max11, type:varchar(50), comment:null), FieldSchema(name:max12, type:varchar(50), comment:null), FieldSchema(name:max13, type:varchar(50), comment:null), FieldSchema(name:max14, type:varchar(50), comment:null), FieldSchema(name:max15, type:varchar(50), comment:null), FieldSchema(name:max16, type:varchar(50), comment:null), FieldSchema(name:max17, type:varchar(50), comment:null), FieldSchema(name:max18, type:varchar(50), comment:null), FieldSchema(name:max19, type:varchar(50), comment:null), FieldSchema(name:max20, type:varchar(50), comment:null), FieldSchema(name:max21, type:varchar(50), comment:null)], location:hdfs://wn4.kara:8020/apps/hive/warehouse/ingest.db/em_mara_snap, inputFormat:org.apache.hadoop.hive.ql.io.orc.OrcInputFormat, outputFormat:org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat, compressed:false, numBuckets:10, serdeInfo:SerDeInfo(name:null, serializationLib:org.apache.hadoop.hive.ql.io.orc.OrcSerde, parameters:{serialization.format=1}), bucketCols:[matnr], sortCols:[], parameters:{}, skewedInfo:SkewedInfo(skewedColNames:[], skewedColValues:[], skewedColValueLocationMaps:{}), storedAsSubDirectories:false), partitionKeys:[], parameters:{totalSize=14837, numRows=7, rawDataSize=16367, COLUMN_STATS_ACCURATE=true, numFiles=10, transient_lastDdlTime=1446439910}, viewOriginalText:null, viewExpandedText:null, tableType:MANAGED_TABLE)


--Following query took 10 min and jamed resources of machine, DDL of em_mara_new is above

hive> insert into dw_sourcing.d_Item
    > SELECT incr(), MATNR,
    >     MTART,    MBRSH,    MATKL,
    >     MEINS,    BSTME,    
    >     MAX01,    MAX02,
    >     MAX03,    MAX04,    MAX05,    MAX06,
    >     MAX07,    MAX08,    MAX09,    MAX10,
    >     MAX11,    MAX12,    MAX13,    MAX14,
    >     MAX15,    MAX16,    MAX17,    MAX18,
    >     MAX19,    MAX20,    MAX21,'2015-10-10','2999-12-31'
    > FROM `ingest`.`em_mara_new`;
Query ID = kannappan_20151224155447_04f5378a-1e4a-46bd-9e4b-151f4148b050
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 5
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1450994583832_0013, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0013/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0013
Hadoop job information for Stage-1: number of mappers: 10; number of reducers: 5
2015-12-24 15:55:03,603 Stage-1 map = 0%,  reduce = 0%
2015-12-24 15:55:18,306 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 17.8 sec
2015-12-24 15:55:20,153 Stage-1 map = 40%,  reduce = 0%, Cumulative CPU 24.73 sec
2015-12-24 15:55:29,809 Stage-1 map = 70%,  reduce = 0%, Cumulative CPU 48.33 sec
2015-12-24 15:55:32,344 Stage-1 map = 70%,  reduce = 3%, Cumulative CPU 48.99 sec
2015-12-24 15:55:35,892 Stage-1 map = 70%,  reduce = 5%, Cumulative CPU 49.13 sec
2015-12-24 15:57:21,828 Stage-1 map = 70%,  reduce = 9%, Cumulative CPU 54.13 sec
2015-12-24 15:58:48,235 Stage-1 map = 70%,  reduce = 9%, Cumulative CPU 82.36 sec
2015-12-24 16:00:22,296 Stage-1 map = 70%,  reduce = 9%, Cumulative CPU 84.63 sec
2015-12-24 16:01:17,652 Stage-1 map = 80%,  reduce = 9%, Cumulative CPU 85.93 sec
2015-12-24 16:01:41,377 Stage-1 map = 70%,  reduce = 9%, Cumulative CPU 86.46 sec
2015-12-24 16:01:49,945 Stage-1 map = 80%,  reduce = 9%, Cumulative CPU 93.0 sec
2015-12-24 16:01:52,066 Stage-1 map = 80%,  reduce = 10%, Cumulative CPU 93.07 sec
2015-12-24 16:01:53,141 Stage-1 map = 80%,  reduce = 11%, Cumulative CPU 93.11 sec
2015-12-24 16:02:40,474 Stage-1 map = 87%,  reduce = 11%, Cumulative CPU 123.74 sec
2015-12-24 16:02:41,538 Stage-1 map = 100%,  reduce = 11%, Cumulative CPU 158.29 sec
2015-12-24 16:03:27,811 Stage-1 map = 100%,  reduce = 12%, Cumulative CPU 159.05 sec
2015-12-24 16:03:28,875 Stage-1 map = 100%,  reduce = 27%, Cumulative CPU 163.24 sec
2015-12-24 16:03:29,932 Stage-1 map = 100%,  reduce = 40%, Cumulative CPU 170.17 sec
2015-12-24 16:03:44,768 Stage-1 map = 100%,  reduce = 60%, Cumulative CPU 176.12 sec
2015-12-24 16:03:46,235 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 183.23 sec
2015-12-24 16:04:46,675 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 184.04 sec
2015-12-24 16:05:35,295 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 192.63 sec
MapReduce Total cumulative CPU time: 3 minutes 12 seconds 630 msec
Ended Job = job_1450994583832_0013
Loading data to table dw_sourcing.d_item
Table dw_sourcing.d_item stats: [numFiles=5, numRows=7, totalSize=4370, rawDataSize=0]
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 10  Reduce: 5   Cumulative CPU: 192.63 sec   HDFS Read: 21403 HDFS Write: 4640 SUCCESS
Total MapReduce CPU Time Spent: 3 minutes 12 seconds 630 msec
OK
Time taken: 651.695 seconds


