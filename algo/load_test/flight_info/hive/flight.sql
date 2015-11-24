create database load_test;


create external table flight_delays_raw (
Year String, Month String, DayofMonth String, DayOfWeek String, DepTime String, CRSDepTime String, ArrTime String, CRSArrTime String,UniqueCarrier String,FlightNum String, TailNum String, ActualElapsedTime String, CRSElapsedTime String, AirTime String,  ArrDelay String, DepDelay String, Origin String, Dest String, Distance String, TaxiIn String, TaxiOut String, Cancelled String, CancellationCode String, Diverted String, CarrierDelay String, WeatherDelay String, NASDelay String, SecurityDelay String, LateAircraftDelay String  
)
ROW FORMAT DELIMITED 
 FIELDS TERMINATED BY ','
 LINES TERMINATED BY '\n'
 STORED AS TEXTFILE
 LOCATION '/datalake/algo/load_test/flight_info/data/base';

-------------------------------------


create external table flight_delays (
Year Int, Month Int, DayofMonth Int, DayOfWeek Int, DepTime Int, CRSDepTime Int, ArrTime Int, CRSArrTime Int,UniqueCarrier String,FlightNum Int, TailNum String, ActualElapsedTime Int, CRSElapsedTime Int, AirTime Int,  ArrDelay Int, DepDelay Int, Origin String, Dest String, Distance Int
)
ROW FORMAT DELIMITED 
 FIELDS TERMINATED BY ','
 LINES TERMINATED BY '\n'
 STORED AS TEXTFILE
 LOCATION '/datalake/algo/load_test/flight_info/data/hive/flight_delays_no_NA';

insert into flight_delays
select 
cast(Year as INT) , cast(Month as Int) , cast(DayofMonth as Int) , cast(DayOfWeek as Int) , cast(DepTime as Int) , cast(CRSDepTime as Int) , cast(ArrTime as Int) , cast(CRSArrTime as Int) ,UniqueCarrier ,cast(FlightNum as Int), TailNum    , cast(ActualElapsedTime as Int) , cast(CRSElapsedTime as Int) , cast(AirTime as Int) , cast( ArrDelay as Int) , cast(DepDelay as Int) , Origin , Dest , cast(Distance as Int)
from flight_delays_raw where 
DayOfWeek <> 'NA' and DepTime <> 'NA' and  CRSDepTime <> 'NA' and  ArrTime <> 'NA' and  CRSArrTime <> 'NA' and UniqueCarrier <> 'NA' and FlightNum <> 'NA' and  TailNum <> 'NA' and ActualElapsedTime <> 'NA' and  CRSElapsedTime <> 'NA' and  AirTime <> 'NA' and   ArrDelay <> 'NA' and  DepDelay <> 'NA' and  Origin <> 'NA' and Dest  <> 'NA' and Distance <> 'NA' limit 2;

create table flight_delays_orc (
Year Int, Month Int, DayofMonth Int, DayOfWeek Int, DepTime Int, CRSDepTime Int, ArrTime Int, CRSArrTime Int,UniqueCarrier String,FlightNum Int, TailNum String, ActualElapsedTime Int, CRSElapsedTime Int, AirTime Int,  ArrDelay Int, DepDelay Int, Origin String, Dest String, Distance Int
)
STORED AS ORC;

Loading data to table load_test.flight_delays
Table load_test.flight_delays stats: [numFiles=38, numRows=102180960, totalSize=7413504672, rawDataSize=7311323712]

Loading data to table load_test.flight_delays_orc
Table load_test.flight_delays_orc stats: [numFiles=38, numRows=102180960, totalSize=348574744, rawDataSize=41792012640]


7 413 504 672
1 48
  348 574 744



ive> explain select count(*) from flight_delays_orc where TailNum='N712SW';
OK
Plan not optimized by CBO.

Vertex dependency in root stage
Reducer 2 <- Map 1 (SIMPLE_EDGE)

Stage-0
   Fetch Operator
      limit:-1
      Stage-1
         Reducer 2
         File Output Operator [FS_7]
            compressed:false
            Statistics:Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            table:{"input format:":"org.apache.hadoop.mapred.TextInputFormat","output format:":"org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat","serde:":"org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"}
            Group By Operator [GBY_5]
            |  aggregations:["count(VALUE._col0)"]
            |  outputColumnNames:["_col0"]
            |  Statistics:Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            |<-Map 1 [SIMPLE_EDGE]
               Reduce Output Operator [RS_4]
                  sort order:
                  Statistics:Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
                  value expressions:_col0 (type: bigint)
                  Group By Operator [OP_11]
                     aggregations:["count()"]
                     outputColumnNames:["_col0"]
                     Statistics:Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
                     Select Operator [OP_10]
                        Statistics:Num rows: 51090480 Data size: 20896006320 Basic stats: COMPLETE Column stats: NONE
                        Filter Operator [FIL_9]
                           predicate:(tailnum = 'N712SW') (type: boolean)
                           Statistics:Num rows: 51090480 Data size: 20896006320 Basic stats: COMPLETE Column stats: NONE
                           TableScan [TS_0]
                              alias:flight_delays_orc
                              Statistics:Num rows: 102180960 Data size: 41792012640 Basic stats: COMPLETE Column stats: NONE

Time taken: 0.56 seconds, Fetched: 36 row(s)
hive>  select count(*) from flight_delays_orc where TailNum='N712SW';



hive> select * from flight_delays_orc order by tailnum limit 10000;
Query ID = kannappan_20151123145024_74d98661-e24d-4bc3-9066-1f67c48c5a63
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448292303321_0018, Tracking URL = http://wn2.kara:8088/proxy/application_1448292303321_0018/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448292303321_0018
Hadoop job information for Stage-1: number of mappers: 2; number of reducers: 1
2015-11-23 14:50:41,018 Stage-1 map = 0%,  reduce = 0%
2015-11-23 14:51:41,437 Stage-1 map = 0%,  reduce = 0%, Cumulative CPU 30.29 sec
2015-11-23 14:51:44,872 Stage-1 map = 1%,  reduce = 0%, Cumulative CPU 36.18 sec
2015-11-23 14:51:47,005 Stage-1 map = 5%,  reduce = 0%, Cumulative CPU 38.7 sec
2015-11-23 14:51:49,106 Stage-1 map = 100%,  reduce = 100%
MapReduce Total cumulative CPU time: 38 seconds 700 msec
Ended Job = job_1448292303321_0018 with errors
Error during job, obtaining debugging information...
Examining task ID: task_1448292303321_0018_m_000001 (and more) from job job_1448292303321_0018

Task with the most failures(4): 
-----
Task ID:
  task_1448292303321_0018_m_000001

URL:
  http://wn2.kara:8088/taskdetails.jsp?jobid=job_1448292303321_0018&tipid=task_1448292303321_0018_m_000001
-----
Diagnostic Messages for this Task:
Container [pid=29350,containerID=container_e49_1448292303321_0018_01_000009] is running beyond physical memory limits. Current usage: 519.1 MB of 512 MB physical memory used; 2.2 GB of 1.0 GB virtual memory used. Killing container.
Dump of the process-tree for container_e49_1448292303321_0018_01_000009 :
	|- PID PPID PGRPID SESSID CMD_NAME USER_MODE_TIME(MILLIS) SYSTEM_TIME(MILLIS) VMEM_USAGE(BYTES) RSSMEM_USAGE(PAGES) FULL_CMD_LINE
	|- 29356 29350 29350 29350 (java) 2737 117 2234036224 132519 /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.72 35346 attempt_1448292303321_0018_m_000001_3 53876069761033 
	|- 29350 29348 29350 29350 (bash) 0 0 115843072 359 /bin/bash -c /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.72 35346 attempt_1448292303321_0018_m_000001_3 53876069761033 1>/hadoop/yarn/log/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009/stdout 2>/hadoop/yarn/log/application_1448292303321_0018/container_e49_1448292303321_0018_01_000009/stderr  

Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143


FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.mr.MapRedTask
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 2  Reduce: 1   Cumulative CPU: 38.7 sec   HDFS Read: 0 HDFS Write: 0 FAIL
Total MapReduce CPU Time Spent: 38 seconds 700 msec



