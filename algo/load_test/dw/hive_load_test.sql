
CREATE TABLE dw_sourcing.d_Item (
  `item_id` int,
  `material_number` varchar(20),
  `material_type` varchar(50),
  `industry_sector` varchar(50),
  `material_group` varchar(20),
  `base_unit_of_measure` varchar(3),
  `order_unit` varchar(3),
  `material_xx1` varchar(50),
  `material_xx2` varchar(50),
  `material_xx3` varchar(50),
  `material_xx4` varchar(50),
  `material_xx5` varchar(50),
  `material_xx6` varchar(50),
  `material_xx7` varchar(50),
  `material_xx8` varchar(50),
  `material_xx9` varchar(50),
  `material_xx10` varchar(50),
  `material_xx11` varchar(50),
  `material_xx12` varchar(50),
  `material_xx13` varchar(50),
  `material_xx14` varchar(50),
  `material_xx15` varchar(50),
  `material_xx16` varchar(50),
  `material_xx17` varchar(50),
  `material_xx18` varchar(50),
  `material_xx19` varchar(50),
  `material_xx20` varchar(50),
  `material_xx21` varchar(50),
  `eff_from_date` date,
  `eff_to_date` date
 )ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE
LOCATION '/datalake/algo/load_test/dw/d_Item/';


create table dw_sourcing.f_Invoice(
Item_id int,
Vendor_id int,
Date_id int,
inv_fact1 Double,
inv_fact2 Double,
inv_fact3 Double,
inv_fact4 Double,
BSE_XX5 Varchar(50),
BSE_XX6 Varchar(50),
BSE_XX7 Varchar(50),
BSE_XX8 Varchar(50),
BSE_XX9 Varchar(50),
BSE_XX10 Varchar(50),
BSE_XX11 Varchar(50),
BSE_XX12 Varchar(50),
BSE_XX13 Varchar(50),
BSE_XX14 Varchar(50),
BSE_XX15 Varchar(50),
BSE_XX16 Varchar(50),
BSE_XX17 Varchar(50),
BSE_XX18 Varchar(50),
BSE_XX19 Varchar(50),
BSE_XX20 Varchar(50),
BSE_XX21 Varchar(50),
BSE_XX22 Varchar(50),
BSE_XX23 Varchar(50),
BSE_XX24 Varchar(50),
BSE_XX25 Varchar(50)
)ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE
LOCATION '/datalake/algo/load_test/dw/f_Invoice/';


----Load data into bucketed table -------

create table dw_sourcing.f_Invoice_bucket(
Item_id int,
Vendor_id int,
Date_id int,
inv_fact1 Double,
inv_fact2 Double,
inv_fact3 Double,
inv_fact4 Double,
BSE_XX5 Varchar(50),
BSE_XX6 Varchar(50),
BSE_XX7 Varchar(50),
BSE_XX8 Varchar(50),
BSE_XX9 Varchar(50),
BSE_XX10 Varchar(50),
BSE_XX11 Varchar(50),
BSE_XX12 Varchar(50),
BSE_XX13 Varchar(50),
BSE_XX14 Varchar(50),
BSE_XX15 Varchar(50),
BSE_XX16 Varchar(50),
BSE_XX17 Varchar(50),
BSE_XX18 Varchar(50),
BSE_XX19 Varchar(50),
BSE_XX20 Varchar(50),
BSE_XX21 Varchar(50),
BSE_XX22 Varchar(50),
BSE_XX23 Varchar(50),
BSE_XX24 Varchar(50),
BSE_XX25 Varchar(50)
)
CLUSTERED BY (ITEM_ID) INTO 8 buckets
ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE
;


CREATE TABLE dw_sourcing.d_Item_bucket(
  `item_id` int,
  `material_number` varchar(20),
  `material_type` varchar(50),
  `industry_sector` varchar(50),
  `material_group` varchar(20),
  `base_unit_of_measure` varchar(3),
  `order_unit` varchar(3),
  `material_xx1` varchar(50),
  `material_xx2` varchar(50),
  `material_xx3` varchar(50),
  `material_xx4` varchar(50),
  `material_xx5` varchar(50),
  `material_xx6` varchar(50),
  `material_xx7` varchar(50),
  `material_xx8` varchar(50),
  `material_xx9` varchar(50),
  `material_xx10` varchar(50),
  `material_xx11` varchar(50),
  `material_xx12` varchar(50),
  `material_xx13` varchar(50),
  `material_xx14` varchar(50),
  `material_xx15` varchar(50),
  `material_xx16` varchar(50),
  `material_xx17` varchar(50),
  `material_xx18` varchar(50),
  `material_xx19` varchar(50),
  `material_xx20` varchar(50),
  `material_xx21` varchar(50),
  `eff_from_date` date,
  `eff_to_date` date
  )CLUSTERED BY (item_id)INTO 8 buckets
ROW FORMAT DELIMITED
FIELDS TERMINATED by ','
LINES TERMINATED by '\n'
STORED AS TEXTFILE;

-----------------

select I.item_id,
I.material_number,
I.material_type ,
I.industry_sector,
N.Vendor_id ,
N.Date_id ,
N.inv_fact1 ,
N.inv_fact2 ,
N.inv_fact3 ,
N.inv_fact4 ,
N.BSE_XX5  
from d_item I join f_invoice N on I.item_id = N.item_id;

select count(*) from (
select I.item_id from d_item_bucket I join f_invoice_bucket N on I.item_id = N.item_id
)AA  ;


select count(*) from (
select I.item_id from d_item I join f_invoice N on I.item_id = N.item_id
)AA  ;

-------Following query failed with logged error---------------------------------------

hive> select count(*) from (
    > select I.item_id from d_item I join f_invoice N on I.item_id = N.item_id
    > )AA  ;
Query ID = kannappan_20151124141625_96ec907e-4cd6-4b8c-90b2-948c1c89035b
Total jobs = 2
Stage-1 is selected by condition resolver.
Launching Job 1 out of 2
Number of reduce tasks not specified. Estimated from input data size: 17
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448390541096_0017, Tracking URL = http://wn2.kara:8088/proxy/application_1448390541096_0017/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448390541096_0017
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 17
2015-11-24 14:16:45,862 Stage-1 map = 0%,  reduce = 0%
2015-11-24 14:16:58,691 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 11.13 sec
2015-11-24 14:17:04,108 Stage-1 map = 60%,  reduce = 0%, Cumulative CPU 26.78 sec
2015-11-24 14:17:05,271 Stage-1 map = 20%,  reduce = 0%, Cumulative CPU 11.13 sec
2015-11-24 14:17:15,040 Stage-1 map = 20%,  reduce = 1%, Cumulative CPU 12.75 sec
2015-11-24 14:17:17,258 Stage-1 map = 20%,  reduce = 2%, Cumulative CPU 16.21 sec
2015-11-24 14:17:23,822 Stage-1 map = 24%,  reduce = 2%, Cumulative CPU 42.57 sec
2015-11-24 14:17:29,266 Stage-1 map = 29%,  reduce = 2%, Cumulative CPU 48.98 sec
2015-11-24 14:17:31,380 Stage-1 map = 49%,  reduce = 2%, Cumulative CPU 52.22 sec
2015-11-24 14:17:32,434 Stage-1 map = 49%,  reduce = 3%, Cumulative CPU 54.56 sec
2015-11-24 14:17:33,491 Stage-1 map = 49%,  reduce = 4%, Cumulative CPU 54.69 sec
2015-11-24 14:17:34,562 Stage-1 map = 49%,  reduce = 5%, Cumulative CPU 54.79 sec
2015-11-24 14:17:37,763 Stage-1 map = 49%,  reduce = 6%, Cumulative CPU 62.01 sec
2015-11-24 14:17:41,027 Stage-1 map = 49%,  reduce = 7%, Cumulative CPU 66.91 sec
2015-11-24 14:17:42,067 Stage-1 map = 53%,  reduce = 7%, Cumulative CPU 68.4 sec
2015-11-24 14:17:44,523 Stage-1 map = 60%,  reduce = 7%, Cumulative CPU 72.62 sec
2015-11-24 14:17:46,694 Stage-1 map = 60%,  reduce = 9%, Cumulative CPU 73.39 sec
2015-11-24 14:17:47,793 Stage-1 map = 60%,  reduce = 10%, Cumulative CPU 74.01 sec
2015-11-24 14:17:48,878 Stage-1 map = 60%,  reduce = 11%, Cumulative CPU 74.16 sec
2015-11-24 14:17:52,050 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 52.53 sec
MapReduce Total cumulative CPU time: 52 seconds 530 msec
Ended Job = job_1448390541096_0017 with errors
Error during job, obtaining debugging information...
Examining task ID: task_1448390541096_0017_m_000004 (and more) from job job_1448390541096_0017
Examining task ID: task_1448390541096_0017_m_000000 (and more) from job job_1448390541096_0017

Task with the most failures(4): 
-----
Task ID:
  task_1448390541096_0017_m_000002

URL:
  http://wn2.kara:8088/taskdetails.jsp?jobid=job_1448390541096_0017&tipid=task_1448390541096_0017_m_000002
-----
Diagnostic Messages for this Task:
Container [pid=12948,containerID=container_e50_1448390541096_0017_01_000054] is running beyond physical memory limits. Current usage: 517.7 MB of 512 MB physical memory used; 2.2 GB of 1.0 GB virtual memory used. Killing container.
Dump of the process-tree for container_e50_1448390541096_0017_01_000054 :
	|- PID PPID PGRPID SESSID CMD_NAME USER_MODE_TIME(MILLIS) SYSTEM_TIME(MILLIS) VMEM_USAGE(BYTES) RSSMEM_USAGE(PAGES) FULL_CMD_LINE
	|- 12956 12948 12948 12948 (java) 1758 95 2265591808 132182 /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.72 60148 attempt_1448390541096_0017_m_000002_3 54975581388854 
	|- 12948 12946 12948 12948 (bash) 0 0 115843072 359 /bin/bash -c /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.72 60148 attempt_1448390541096_0017_m_000002_3 54975581388854 1>/hadoop/yarn/log/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054/stdout 2>/hadoop/yarn/log/application_1448390541096_0017/container_e50_1448390541096_0017_01_000054/stderr  

Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143


FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.mr.MapRedTask
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 5  Reduce: 17   Cumulative CPU: 52.53 sec   HDFS Read: 564402278 HDFS Write: 0 FAIL
Total MapReduce CPU Time Spent: 52 seconds 530 msec

--------------------------------------------------
	|
	|
After above failure ,  In Amabari  YARN-CONTAINER size is increased to 1024MB from 512MB
YARN Change triggered recommended changes for MAP memory  to 0.5 --> 1GB and REDUCE memory to 1 -- 2GB




hive> select count(*) from (
    > select I.item_id from d_item I join f_invoice N on I.item_id = N.item_id
    > )AA  ;
Query ID = kannappan_20151124145125_fe2cb071-5c14-4469-8b88-e730035cf221
Total jobs = 2
Stage-1 is selected by condition resolver.
Launching Job 1 out of 2
Number of reduce tasks not specified. Estimated from input data size: 17
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448405350328_0001, Tracking URL = http://wn2.kara:8088/proxy/application_1448405350328_0001/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448405350328_0001
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 17
2015-11-24 14:51:55,695 Stage-1 map = 0%,  reduce = 0%
2015-11-24 14:52:20,030 Stage-1 map = 3%,  reduce = 0%, Cumulative CPU 25.06 sec
2015-11-24 14:52:21,093 Stage-1 map = 23%,  reduce = 0%, Cumulative CPU 26.85 sec
2015-11-24 14:52:22,162 Stage-1 map = 47%,  reduce = 0%, Cumulative CPU 31.09 sec
2015-11-24 14:52:23,225 Stage-1 map = 53%,  reduce = 0%, Cumulative CPU 32.59 sec
2015-11-24 14:52:24,286 Stage-1 map = 60%,  reduce = 0%, Cumulative CPU 34.34 sec
2015-11-24 14:52:37,739 Stage-1 map = 60%,  reduce = 4%, Cumulative CPU 37.16 sec
2015-11-24 14:52:38,868 Stage-1 map = 60%,  reduce = 5%, Cumulative CPU 38.22 sec
2015-11-24 14:52:39,937 Stage-1 map = 60%,  reduce = 6%, Cumulative CPU 39.0 sec
2015-11-24 14:52:48,624 Stage-1 map = 60%,  reduce = 9%, Cumulative CPU 62.11 sec
2015-11-24 14:52:54,922 Stage-1 map = 60%,  reduce = 11%, Cumulative CPU 71.58 sec
2015-11-24 14:52:59,157 Stage-1 map = 64%,  reduce = 11%, Cumulative CPU 74.72 sec
2015-11-24 14:53:00,208 Stage-1 map = 68%,  reduce = 11%, Cumulative CPU 75.49 sec
2015-11-24 14:53:05,479 Stage-1 map = 73%,  reduce = 11%, Cumulative CPU 78.89 sec
2015-11-24 14:53:06,541 Stage-1 map = 77%,  reduce = 11%, Cumulative CPU 79.95 sec
2015-11-24 14:53:11,800 Stage-1 map = 82%,  reduce = 11%, Cumulative CPU 84.64 sec
2015-11-24 14:53:12,857 Stage-1 map = 87%,  reduce = 11%, Cumulative CPU 87.28 sec
2015-11-24 14:53:17,035 Stage-1 map = 93%,  reduce = 11%, Cumulative CPU 97.28 sec
2015-11-24 14:53:22,287 Stage-1 map = 93%,  reduce = 13%, Cumulative CPU 103.32 sec
2015-11-24 14:53:23,363 Stage-1 map = 100%,  reduce = 14%, Cumulative CPU 104.53 sec
2015-11-24 14:53:24,492 Stage-1 map = 100%,  reduce = 15%, Cumulative CPU 105.39 sec
2015-11-24 14:53:25,645 Stage-1 map = 100%,  reduce = 29%, Cumulative CPU 115.44 sec
2015-11-24 14:53:26,905 Stage-1 map = 100%,  reduce = 35%, Cumulative CPU 124.33 sec
2015-11-24 14:53:28,026 Stage-1 map = 100%,  reduce = 36%, Cumulative CPU 133.22 sec
2015-11-24 14:53:29,243 Stage-1 map = 100%,  reduce = 37%, Cumulative CPU 144.38 sec
2015-11-24 14:53:30,414 Stage-1 map = 100%,  reduce = 39%, Cumulative CPU 152.62 sec
2015-11-24 14:53:31,569 Stage-1 map = 100%,  reduce = 42%, Cumulative CPU 167.9 sec
2015-11-24 14:53:32,790 Stage-1 map = 100%,  reduce = 44%, Cumulative CPU 175.84 sec
2015-11-24 14:53:33,977 Stage-1 map = 100%,  reduce = 46%, Cumulative CPU 183.11 sec
2015-11-24 14:53:35,158 Stage-1 map = 100%,  reduce = 48%, Cumulative CPU 194.29 sec
2015-11-24 14:53:38,554 Stage-1 map = 100%,  reduce = 50%, Cumulative CPU 203.07 sec
2015-11-24 14:53:39,624 Stage-1 map = 100%,  reduce = 51%, Cumulative CPU 205.12 sec
2015-11-24 14:53:42,802 Stage-1 map = 100%,  reduce = 57%, Cumulative CPU 222.33 sec
2015-11-24 14:53:45,040 Stage-1 map = 100%,  reduce = 63%, Cumulative CPU 234.07 sec
2015-11-24 14:53:46,122 Stage-1 map = 100%,  reduce = 65%, Cumulative CPU 239.37 sec
2015-11-24 14:53:48,249 Stage-1 map = 100%,  reduce = 71%, Cumulative CPU 250.62 sec
2015-11-24 14:53:50,367 Stage-1 map = 100%,  reduce = 78%, Cumulative CPU 258.72 sec
2015-11-24 14:53:52,482 Stage-1 map = 100%,  reduce = 82%, Cumulative CPU 262.37 sec
2015-11-24 14:53:53,547 Stage-1 map = 100%,  reduce = 84%, Cumulative CPU 267.83 sec
2015-11-24 14:53:55,658 Stage-1 map = 100%,  reduce = 85%, Cumulative CPU 270.54 sec
2015-11-24 14:53:56,720 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 275.94 sec
2015-11-24 14:53:57,785 Stage-1 map = 100%,  reduce = 96%, Cumulative CPU 289.64 sec
2015-11-24 14:54:00,985 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 299.8 sec
2015-11-24 14:54:03,596 Stage-1 map = 100%,  reduce = 99%, Cumulative CPU 303.4 sec
2015-11-24 14:54:04,650 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 308.28 sec
MapReduce Total cumulative CPU time: 5 minutes 8 seconds 280 msec
Ended Job = job_1448405350328_0001
Launching Job 2 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448405350328_0002, Tracking URL = http://wn2.kara:8088/proxy/application_1448405350328_0002/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448405350328_0002
Hadoop job information for Stage-2: number of mappers: 2; number of reducers: 1
2015-11-24 14:54:23,841 Stage-2 map = 0%,  reduce = 0%
2015-11-24 14:55:01,975 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 13.7 sec
2015-11-24 14:55:13,640 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 19.22 sec
MapReduce Total cumulative CPU time: 19 seconds 220 msec
Ended Job = job_1448405350328_0002
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 5  Reduce: 17   Cumulative CPU: 308.28 sec   HDFS Read: 1080371527 HDFS Write: 1989 SUCCESS
Stage-Stage-2: Map: 2  Reduce: 1   Cumulative CPU: 19.22 sec   HDFS Read: 12142 HDFS Write: 8 SUCCESS
Total MapReduce CPU Time Spent: 5 minutes 27 seconds 500 msec
OK
2097152
Time taken: 229.749 seconds, Fetched: 1 row(s)

-------------------------------------------------------------------------------------------------------------


select count(*) from (
 select I.item_id from d_item_bucket I join f_invoice_bucket N on I.item_id = N.item_id
 )AA  ;


hive> select count(*) from (
    >  select I.item_id from d_item_bucket I join f_invoice_bucket N on I.item_id = N.item_id
    >  )AA  ;
Query ID = kannappan_20151124152951_a90e96b7-3997-41f4-8808-57bdeecdd536
Total jobs = 2
Stage-1 is selected by condition resolver.
Launching Job 1 out of 2
Number of reduce tasks not specified. Estimated from input data size: 16
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448405350328_0005, Tracking URL = http://wn2.kara:8088/proxy/application_1448405350328_0005/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448405350328_0005
Hadoop job information for Stage-1: number of mappers: 5; number of reducers: 16
2015-11-24 15:30:18,625 Stage-1 map = 0%,  reduce = 0%
2015-11-24 15:30:34,234 Stage-1 map = 3%,  reduce = 0%, Cumulative CPU 19.63 sec
2015-11-24 15:30:36,418 Stage-1 map = 10%,  reduce = 0%, Cumulative CPU 28.78 sec
2015-11-24 15:30:37,500 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 34.52 sec
2015-11-24 15:30:39,672 Stage-1 map = 43%,  reduce = 0%, Cumulative CPU 38.72 sec
2015-11-24 15:30:40,744 Stage-1 map = 47%,  reduce = 0%, Cumulative CPU 40.53 sec
2015-11-24 15:30:41,815 Stage-1 map = 53%,  reduce = 0%, Cumulative CPU 42.38 sec
2015-11-24 15:30:46,567 Stage-1 map = 60%,  reduce = 0%, Cumulative CPU 45.59 sec
2015-11-24 15:30:53,383 Stage-1 map = 60%,  reduce = 1%, Cumulative CPU 46.84 sec
2015-11-24 15:30:55,618 Stage-1 map = 60%,  reduce = 3%, Cumulative CPU 47.53 sec
2015-11-24 15:31:55,963 Stage-1 map = 60%,  reduce = 3%, Cumulative CPU 66.54 sec
2015-11-24 15:32:57,178 Stage-1 map = 60%,  reduce = 3%, Cumulative CPU 69.52 sec
2015-11-24 15:33:04,761 Stage-1 map = 63%,  reduce = 3%, Cumulative CPU 101.0 sec
2015-11-24 15:33:11,471 Stage-1 map = 67%,  reduce = 3%, Cumulative CPU 106.44 sec
2015-11-24 15:33:16,794 Stage-1 map = 70%,  reduce = 3%, Cumulative CPU 108.64 sec
2015-11-24 15:33:21,344 Stage-1 map = 77%,  reduce = 3%, Cumulative CPU 109.76 sec
2015-11-24 15:33:33,017 Stage-1 map = 80%,  reduce = 3%, Cumulative CPU 112.04 sec
2015-11-24 15:33:39,547 Stage-1 map = 87%,  reduce = 3%, Cumulative CPU 116.69 sec
2015-11-24 15:33:49,078 Stage-1 map = 100%,  reduce = 3%, Cumulative CPU 119.51 sec
2015-11-24 15:33:51,198 Stage-1 map = 100%,  reduce = 5%, Cumulative CPU 120.05 sec
2015-11-24 15:33:52,363 Stage-1 map = 100%,  reduce = 8%, Cumulative CPU 124.33 sec
2015-11-24 15:33:54,456 Stage-1 map = 100%,  reduce = 11%, Cumulative CPU 130.46 sec
2015-11-24 15:33:55,516 Stage-1 map = 100%,  reduce = 13%, Cumulative CPU 134.94 sec
2015-11-24 15:34:03,215 Stage-1 map = 100%,  reduce = 19%, Cumulative CPU 142.29 sec
2015-11-24 15:34:04,272 Stage-1 map = 100%,  reduce = 25%, Cumulative CPU 148.66 sec
2015-11-24 15:34:12,115 Stage-1 map = 100%,  reduce = 31%, Cumulative CPU 156.1 sec
2015-11-24 15:34:16,388 Stage-1 map = 100%,  reduce = 38%, Cumulative CPU 165.7 sec
2015-11-24 15:34:20,611 Stage-1 map = 100%,  reduce = 44%, Cumulative CPU 177.44 sec
2015-11-24 15:34:26,952 Stage-1 map = 100%,  reduce = 50%, Cumulative CPU 186.69 sec
2015-11-24 15:34:32,245 Stage-1 map = 100%,  reduce = 56%, Cumulative CPU 199.32 sec
2015-11-24 15:34:37,536 Stage-1 map = 100%,  reduce = 63%, Cumulative CPU 208.35 sec
2015-11-24 15:34:40,717 Stage-1 map = 100%,  reduce = 69%, Cumulative CPU 216.16 sec
2015-11-24 15:34:49,306 Stage-1 map = 100%,  reduce = 75%, Cumulative CPU 223.6 sec
2015-11-24 15:34:51,407 Stage-1 map = 100%,  reduce = 81%, Cumulative CPU 231.87 sec
2015-11-24 15:34:56,766 Stage-1 map = 100%,  reduce = 88%, Cumulative CPU 240.97 sec
2015-11-24 15:35:01,030 Stage-1 map = 100%,  reduce = 94%, Cumulative CPU 247.34 sec
2015-11-24 15:35:29,718 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 249.33 sec
2015-11-24 15:35:44,619 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 257.16 sec
MapReduce Total cumulative CPU time: 4 minutes 17 seconds 160 msec
Ended Job = job_1448405350328_0005
Launching Job 2 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448405350328_0006, Tracking URL = http://wn2.kara:8088/proxy/application_1448405350328_0006/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448405350328_0006
Hadoop job information for Stage-2: number of mappers: 2; number of reducers: 1
2015-11-24 15:35:59,835 Stage-2 map = 0%,  reduce = 0%
2015-11-24 15:36:22,327 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 9.64 sec
2015-11-24 15:36:34,035 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 16.83 sec
MapReduce Total cumulative CPU time: 16 seconds 830 msec
Ended Job = job_1448405350328_0006
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 5  Reduce: 16   Cumulative CPU: 257.16 sec   HDFS Read: 1071098722 HDFS Write: 1872 SUCCESS
Stage-Stage-2: Map: 2  Reduce: 1   Cumulative CPU: 16.83 sec   HDFS Read: 11783 HDFS Write: 8 SUCCESS
Total MapReduce CPU Time Spent: 4 minutes 33 seconds 990 msec
OK
2097152
Time taken: 406.136 seconds, Fetched: 1 row(s)
hive> 


explain select count(*) from (
 select I.item_id from d_item_bucket I join f_invoice_bucket N on I.item_id = N.item_id
 )AA  ;


