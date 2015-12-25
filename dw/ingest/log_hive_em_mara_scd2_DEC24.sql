hive> truncate table dw_sourcing.d_item;
OK
Time taken: 0.563 seconds
hive> truncate table ingest.em_mara_snap;
OK
Time taken: 0.397 seconds
hive> truncate table ingest.em_mara_new ;
OK
Time taken: 0.372 seconds
hive> truncate table ingest.em_mara_changed ;
OK
Time taken: 0.454 seconds
hive> insert into ingest.em_mara_snap
    > select
    > concat('MAT',MATNR),MTART,MBRSH,MATKL,MEINS,BSTME,MAX01,MAX02,MAX03,MAX04,MAX05,MAX06,MAX07,MAX08,MAX09,MAX10,MAX11,
    > MAX12,MAX13,MAX14,MAX15,MAX16,MAX17,MAX18,MAX19,MAX20,MAX21
    > FROM `ingest`.`em_mara2` ;
Query ID = kannappan_20151224214603_36430173-b651-42f5-8c85-a9e27cff4649
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1450994583832_0059, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0059/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0059
Hadoop job information for Stage-1: number of mappers: 10; number of reducers: 0
2015-12-24 21:46:18,997 Stage-1 map = 0%,  reduce = 0%
2015-12-24 21:46:31,183 Stage-1 map = 10%,  reduce = 0%, Cumulative CPU 8.38 sec
2015-12-24 21:46:33,571 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 16.2 sec
2015-12-24 21:46:34,724 Stage-1 map = 40%,  reduce = 0%, Cumulative CPU 51.03 sec
2015-12-24 21:46:35,929 Stage-1 map = 60%,  reduce = 0%, Cumulative CPU 83.9 sec
2015-12-24 21:46:40,416 Stage-1 map = 70%,  reduce = 0%, Cumulative CPU 109.13 sec
2015-12-24 21:46:41,477 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 134.95 sec
MapReduce Total cumulative CPU time: 2 minutes 14 seconds 950 msec
Ended Job = job_1450994583832_0059
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to: hdfs://wn4.kara:8020/apps/hive/warehouse/ingest.db/em_mara_snap/.hive-staging_hive_2015-12-24_21-46-03_838_7647918981010746208-1/-ext-10000
Loading data to table ingest.em_mara_snap
Table ingest.em_mara_snap stats: [numFiles=10, numRows=823173, totalSize=168207661, rawDataSize=167384488]
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 10   Cumulative CPU: 150.61 sec   HDFS Read: 36840358 HDFS Write: 168208501 SUCCESS
Total MapReduce CPU Time Spent: 2 minutes 30 seconds 610 msec
OK
Time taken: 47.086 seconds
hive> insert into ingest.em_mara_new 
    > SELECT MATNR,
    >     MTART,    MBRSH,    MATKL,
    >     MEINS,    BSTME,    
    >     MAX01,    MAX02,
    >     MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    >     MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    >     MAX19,    MAX20,    MAX21
    > FROM `ingest`.`em_mara_snap` LEFT join dw_sourcing.d_Item item
    > on
    > MATNR=item.material_number 
    > where item.material_number is null;
Query ID = kannappan_20151224214819_59b89396-b604-457d-b031-21129cb0ea0c
Total jobs = 1
WARNING: Use "yarn jar" to launch YARN applications.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/usr/hdp/2.3.0.0-2557/hadoop/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/hdp/2.3.0.0-2557/spark/lib/spark-assembly-1.3.1.2.3.0.0-2557-hadoop2.7.1.2.3.0.0-2557.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Execution log at: /tmp/kannappan/kannappan_20151224214819_59b89396-b604-457d-b031-21129cb0ea0c.log
2015-12-24 21:48:26	Starting to launch local task to process map join;	maximum memory = 1046478848
2015-12-24 21:48:28	Dump the side-table for tag: 1 with group count: 0 into file: file:/tmp/kannappan/d15b5f80-3d47-49a4-9ebe-7d69fbdf7df9/hive_2015-12-24_21-48-19_792_4183535568173173509-1/-local-10002/HashTable-Stage-4/MapJoin-mapfile21--.hashtable
2015-12-24 21:48:28	Uploaded 1 File to: file:/tmp/kannappan/d15b5f80-3d47-49a4-9ebe-7d69fbdf7df9/hive_2015-12-24_21-48-19_792_4183535568173173509-1/-local-10002/HashTable-Stage-4/MapJoin-mapfile21--.hashtable (260 bytes)
2015-12-24 21:48:28	End of local task; Time Taken: 1.571 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1450994583832_0060, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0060/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0060
Hadoop job information for Stage-4: number of mappers: 2; number of reducers: 0
2015-12-24 21:48:40,656 Stage-4 map = 0%,  reduce = 0%
2015-12-24 21:48:53,581 Stage-4 map = 19%,  reduce = 0%, Cumulative CPU 20.28 sec
2015-12-24 21:48:55,792 Stage-4 map = 27%,  reduce = 0%, Cumulative CPU 24.76 sec
2015-12-24 21:48:59,191 Stage-4 map = 53%,  reduce = 0%, Cumulative CPU 28.6 sec
2015-12-24 21:49:02,523 Stage-4 map = 72%,  reduce = 0%, Cumulative CPU 30.87 sec
2015-12-24 21:49:05,730 Stage-4 map = 78%,  reduce = 0%, Cumulative CPU 33.44 sec
2015-12-24 21:49:07,900 Stage-4 map = 86%,  reduce = 0%, Cumulative CPU 36.36 sec
2015-12-24 21:49:11,134 Stage-4 map = 100%,  reduce = 0%, Cumulative CPU 39.24 sec
MapReduce Total cumulative CPU time: 39 seconds 240 msec
Ended Job = job_1450994583832_0060
Loading data to table ingest.em_mara_new
Table ingest.em_mara_new stats: [numFiles=2, numRows=823173, totalSize=168207661, rawDataSize=167384488]
MapReduce Jobs Launched: 
Stage-Stage-4: Map: 2   Cumulative CPU: 39.24 sec   HDFS Read: 168208825 HDFS Write: 168207830 SUCCESS
Total MapReduce CPU Time Spent: 39 seconds 240 msec
OK
Time taken: 54.245 seconds
hive> select count(*) from dw_sourcing.d_Item;
Query ID = kannappan_20151224214948_69c64a8c-54b6-4885-a9a4-8a867fb7007c
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1450994583832_0061, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0061/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0061
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2015-12-24 21:49:59,470 Stage-1 map = 0%,  reduce = 0%
2015-12-24 21:50:06,977 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 4.18 sec
2015-12-24 21:50:20,101 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 8.97 sec
MapReduce Total cumulative CPU time: 8 seconds 970 msec
Ended Job = job_1450994583832_0061
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 8.97 sec   HDFS Read: 373 HDFS Write: 2 SUCCESS
Total MapReduce CPU Time Spent: 8 seconds 970 msec
OK
0
Time taken: 32.525 seconds, Fetched: 1 row(s)
hive> insert into dw_sourcing.d_Item
    > SELECT incr(), MATNR,
    >     MTART,    MBRSH,    MATKL,
    >     MEINS,    BSTME,    
    >     MAX01,    MAX02,
    >     MAX03,    MAX04,    MAX05,    MAX06,    MAX07,    MAX08,    MAX09,    MAX10,
    >     MAX11,    MAX12,    MAX13,    MAX14,    MAX15,    MAX16,    MAX17,    MAX18,
    >     MAX19,    MAX20,    MAX21,'2015-10-10','2999-12-31'
    > FROM `ingest`.`em_mara_new`;
Query ID = kannappan_20151224215027_0c6d34f9-967c-42b8-94a5-b19c59dbe3f4
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 5
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1450994583832_0062, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0062/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0062
Hadoop job information for Stage-1: number of mappers: 2; number of reducers: 5
2015-12-24 21:50:41,610 Stage-1 map = 0%,  reduce = 0%
2015-12-24 21:50:52,499 Stage-1 map = 50%,  reduce = 0%, Cumulative CPU 12.02 sec
2015-12-24 21:51:02,253 Stage-1 map = 50%,  reduce = 3%, Cumulative CPU 31.09 sec
2015-12-24 21:51:03,323 Stage-1 map = 50%,  reduce = 7%, Cumulative CPU 32.15 sec
2015-12-24 21:51:06,506 Stage-1 map = 50%,  reduce = 10%, Cumulative CPU 36.82 sec
2015-12-24 21:51:07,566 Stage-1 map = 50%,  reduce = 13%, Cumulative CPU 43.48 sec
2015-12-24 21:51:09,716 Stage-1 map = 100%,  reduce = 13%, Cumulative CPU 46.94 sec
2015-12-24 21:51:15,464 Stage-1 map = 100%,  reduce = 23%, Cumulative CPU 53.36 sec
2015-12-24 21:51:20,040 Stage-1 map = 100%,  reduce = 27%, Cumulative CPU 63.87 sec
2015-12-24 21:51:21,113 Stage-1 map = 100%,  reduce = 37%, Cumulative CPU 72.28 sec
2015-12-24 21:51:22,193 Stage-1 map = 100%,  reduce = 47%, Cumulative CPU 79.68 sec
2015-12-24 21:51:23,286 Stage-1 map = 100%,  reduce = 53%, Cumulative CPU 85.82 sec
2015-12-24 21:51:24,345 Stage-1 map = 100%,  reduce = 60%, Cumulative CPU 95.14 sec
2015-12-24 21:51:25,465 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 105.07 sec
2015-12-24 21:51:27,611 Stage-1 map = 100%,  reduce = 73%, Cumulative CPU 114.83 sec
2015-12-24 21:51:35,282 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 140.73 sec
2015-12-24 21:51:40,612 Stage-1 map = 100%,  reduce = 93%, Cumulative CPU 161.39 sec
2015-12-24 21:51:46,985 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 171.0 sec
MapReduce Total cumulative CPU time: 2 minutes 51 seconds 0 msec
Ended Job = job_1450994583832_0062
Loading data to table dw_sourcing.d_item
Table dw_sourcing.d_item stats: [numFiles=5, numRows=823173, totalSize=22365519, rawDataSize=0]
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 2  Reduce: 5   Cumulative CPU: 171.0 sec   HDFS Read: 168208111 HDFS Write: 22365929 SUCCESS
Total MapReduce CPU Time Spent: 2 minutes 51 seconds 0 msec
OK
Time taken: 81.465 seconds
hive> select min(item_id), max(item_id) from  dw_sourcing.d_Item;
Query ID = kannappan_20151224220407_2d9a3289-d80c-40b8-9398-7814eb83bea4
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1450994583832_0064, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0064/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0064
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 1
2015-12-24 22:06:44,149 Stage-1 map = 0%,  reduce = 0%
2015-12-24 22:06:55,517 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 11.53 sec
2015-12-24 22:06:59,007 Stage-1 map = 47%,  reduce = 0%, Cumulative CPU 30.6 sec
2015-12-24 22:07:02,512 Stage-1 map = 60%,  reduce = 0%, Cumulative CPU 49.6 sec
2015-12-24 22:07:09,099 Stage-1 map = 80%,  reduce = 0%, Cumulative CPU 64.25 sec
2015-12-24 22:07:13,994 Stage-1 map = 80%,  reduce = 27%, Cumulative CPU 65.11 sec
2015-12-24 22:07:16,114 Stage-1 map = 100%,  reduce = 27%, Cumulative CPU 73.04 sec
2015-12-24 22:07:17,180 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 74.12 sec
2015-12-24 22:07:19,306 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 77.67 sec
MapReduce Total cumulative CPU time: 1 minutes 17 seconds 670 msec
Ended Job = job_1450994583832_0064
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 5  Reduce: 1   Cumulative CPU: 77.67 sec   HDFS Read: 22398396 HDFS Write: 10 SUCCESS
Total MapReduce CPU Time Spent: 1 minutes 17 seconds 670 msec
OK
21	597786
Time taken: 195.659 seconds, Fetched: 1 row(s)
hive> select count(*) from  dw_sourcing.d_Item;
OK
823173
Time taken: 0.505 seconds, Fetched: 1 row(s)
hive> select item_id,material_number,material_type,industry_sector from dw_sourcing.d_Item order by item_id  limit 20;
Query ID = kannappan_20151224221556_fa4c2771-7cd9-420a-89b3-3c5cd78efd04
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1450994583832_0065, Tracking URL = http://wn2.kara:8088/proxy/application_1450994583832_0065/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1450994583832_0065
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 1
2015-12-24 22:16:10,492 Stage-1 map = 0%,  reduce = 0%
2015-12-24 22:16:19,313 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 8.12 sec
2015-12-24 22:16:23,587 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 21.13 sec
2015-12-24 22:16:24,762 Stage-1 map = 40%,  reduce = 0%, Cumulative CPU 21.86 sec
2015-12-24 22:16:31,170 Stage-1 map = 40%,  reduce = 13%, Cumulative CPU 22.63 sec
2015-12-24 22:16:34,422 Stage-1 map = 60%,  reduce = 13%, Cumulative CPU 35.42 sec
2015-12-24 22:16:36,601 Stage-1 map = 60%,  reduce = 20%, Cumulative CPU 35.54 sec
2015-12-24 22:16:53,514 Stage-1 map = 87%,  reduce = 20%, Cumulative CPU 49.34 sec
2015-12-24 22:17:01,348 Stage-1 map = 93%,  reduce = 20%, Cumulative CPU 66.83 sec
2015-12-24 22:17:02,419 Stage-1 map = 100%,  reduce = 20%, Cumulative CPU 69.65 sec
2015-12-24 22:17:03,473 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 71.16 sec
2015-12-24 22:17:05,594 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 72.8 sec
MapReduce Total cumulative CPU time: 1 minutes 12 seconds 800 msec
Ended Job = job_1450994583832_0065
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 5  Reduce: 1   Cumulative CPU: 72.8 sec   HDFS Read: 22398396 HDFS Write: 1192 SUCCESS
Total MapReduce CPU Time Spent: 1 minutes 12 seconds 800 msec
OK
21	MAT20000000	MTART	MBRSH
21	MAT20151406	MTART94045090017.88226	MBRSH91698261342.6617
22	MAT20000001	MTART92153750259.5724	MBRSH28488486472.97219
22	MAT20151407	MTART76356039733.02621	MBRSH6685417710.510471
23	MAT20000002	MTART46024610145.04042	MBRSH42155591810.26704
23	MAT20151408	MTART4358972426.838216	MBRSH1738612076.0241635
24	MAT20000003	MTART72704131689.57841	MBRSH37053886090.455475
24	MAT20151409	MTART95616146172.97067	MBRSH72864897710.14536
25	MAT20000005	MTART67157038456.9066	MBRSH24623537086.53109
25	MAT20151410	MTART77476053105.17926	MBRSH68785575468.82478
26	MAT20000006	MTART21646573135.300144	MBRSH34362257490.27194
26	MAT20151411	MTART11499721101.950594	MBRSH51141882176.64313
27	MAT20151412	MTART21210250650.728355	MBRSH52625609797.07689
27	MAT20000007	MTART6871571118.823784	MBRSH31271086196.667595
28	MAT20151413	MTART99497300106.56387	MBRSH39609674214.953255
28	MAT20000008	MTART35740720700.231125	MBRSH84890347984.51732
29	MAT20000012	MTART17229580895.257725	MBRSH31476863596.101162
29	MAT20151414	MTART99556473828.4391	MBRSH78953349570.70029
30	MAT20000013	MTART5695578368.097151	MBRSH34047304125.54676
30	MAT20151415	MTART96097329441.54863	MBRSH43626601569.00678
Time taken: 71.144 seconds, Fetched: 20 row(s)
hive> 

