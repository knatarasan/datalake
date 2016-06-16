






select count(*) from (
select I.item_id from d_item_bucket I join f_invoice_bucket N on I.item_id = N.item_id
)AA  ;

select count(*) from d_item;
2097152
select count(*) from f_invoice;
2097152


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


----------Populate duplicate data and de-duplicate it -----------------------
select count(*) from d_item;
2097152
select count(*) from f_invoice;
2097152


hive> create view d_Item_v as select * from d_Item;

hive> insert into table d_item2 select * from d_Item union all select * from d_Item_v;

hive>select count(*) from item2
4194304


hive> select * from item_id_dups;
OK
72849	mat_num62529902218.4	mat_typ22212810835.06794	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
72849	mat_num62529902218.4	mat_typ22212810835.06794	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
72859	mat_num13046516210.8	mat_typ9191254348.672232	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
72859	mat_num13046516210.8	mat_typ9191254348.672232	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
72863	mat_num93251476709.9	mat_typ6945486000.688269	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
72863	mat_num93251476709.9	mat_typ6945486000.688269	MT_sec	MAT_GR	MEI	BST	MAX01	MAX02	MAX03	MAX04	MAX05	MAX06	MAX07	MAX08MAX09	MAX10	MAX11	MAX12	MAX13	MAX14	MAX15	MAX16	MAX17	MAX18	MAX19	MAX20	MAX21	2015-10-10	2999-12-31
Time taken: 0.418 seconds, Fetched: 6 row(s)
hive> 

explain select count(*) from 
(select 
item_id	,material_number	,material_type	,industry_sector	,material_group	,base_unit_of_measure	,order_unit	,
material_xx1	,material_xx2	,material_xx3	,material_xx4	,material_xx5	,material_xx6	,material_xx7	,material_xx8	,
material_xx9	,material_xx10	,material_xx11	,material_xx12	,material_xx13	,material_xx14	,material_xx15	,material_xx16	,
material_xx17	,material_xx18	,material_xx19	,material_xx20	,material_xx21	,eff_from_date	,eff_to_date	 
from  d_Item2 group by 
item_id	,material_number	,material_type	,industry_sector	,material_group	,base_unit_of_measure	,order_unit	,
material_xx1	,material_xx2	,material_xx3	,material_xx4	,material_xx5	,material_xx6	,material_xx7	,
material_xx8	,material_xx9	,material_xx10	,material_xx11	,material_xx12	,material_xx13	,material_xx14	,material_xx15	,
material_xx16	,material_xx17	,material_xx18	,material_xx19	,material_xx20	,material_xx21	,eff_from_date,eff_to_date	
) MM;


--- Following query de-duplicates successfully ----------------------

hive> select count(*) from 
    > (select 
    > item_id,material_number,material_type,industry_sector,material_group,base_unit_of_measure,order_unit,
    > material_xx1,material_xx2,material_xx3,material_xx4,material_xx5,material_xx6,material_xx7,material_xx8,
    > material_xx9,material_xx10,material_xx11,material_xx12,material_xx13,material_xx14,material_xx15,material_xx16,
    > material_xx17,material_xx18,material_xx19,material_xx20,material_xx21,eff_from_date,eff_to_date 
    > from  d_Item2 group by 
    > item_id,material_number,material_type,industry_sector,material_group,base_unit_of_measure,order_unit,
    > material_xx1,material_xx2,material_xx3,material_xx4,material_xx5,material_xx6,material_xx7,
    > material_xx8,material_xx9,material_xx10,material_xx11,material_xx12,material_xx13,material_xx14,material_xx15,
    > material_xx16,material_xx17,material_xx18,material_xx19,material_xx20,material_xx21,eff_from_date,eff_to_date
    > ) MM;
Query ID = kannappan_20151126084242_6865fc37-4c53-4a28-99a1-f382f23dfb69
Total jobs = 2
Launching Job 1 out of 2
Number of reduce tasks not specified. Estimated from input data size: 14
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448551896589_0015, Tracking URL = http://wn2.kara:8088/proxy/application_1448551896589_0015/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448551896589_0015
Hadoop job information for Stage-1: number of mappers: 4; number of reducers: 14
2015-11-26 08:42:54,508 Stage-1 map = 0%,  reduce = 0%
2015-11-26 08:43:27,341 Stage-1 map = 8%,  reduce = 0%, Cumulative CPU 200.94 sec
2015-11-26 08:43:33,756 Stage-1 map = 17%,  reduce = 0%, Cumulative CPU 231.24 sec
2015-11-26 08:43:39,294 Stage-1 map = 42%,  reduce = 0%, Cumulative CPU 261.8 sec
2015-11-26 08:43:45,928 Stage-1 map = 58%,  reduce = 0%, Cumulative CPU 289.4 sec
2015-11-26 08:43:52,739 Stage-1 map = 67%,  reduce = 1%, Cumulative CPU 305.9 sec
2015-11-26 08:43:53,807 Stage-1 map = 75%,  reduce = 4%, Cumulative CPU 308.72 sec
2015-11-26 08:43:55,996 Stage-1 map = 75%,  reduce = 5%, Cumulative CPU 312.65 sec
2015-11-26 08:43:58,145 Stage-1 map = 75%,  reduce = 7%, Cumulative CPU 314.43 sec
2015-11-26 08:44:02,413 Stage-1 map = 83%,  reduce = 7%, Cumulative CPU 321.04 sec
2015-11-26 08:44:29,021 Stage-1 map = 92%,  reduce = 7%, Cumulative CPU 346.6 sec
2015-11-26 08:44:30,081 Stage-1 map = 100%,  reduce = 7%, Cumulative CPU 347.35 sec
2015-11-26 08:44:33,350 Stage-1 map = 100%,  reduce = 10%, Cumulative CPU 352.14 sec
2015-11-26 08:44:34,432 Stage-1 map = 100%,  reduce = 13%, Cumulative CPU 355.6 sec
2015-11-26 08:44:35,564 Stage-1 map = 100%,  reduce = 16%, Cumulative CPU 361.19 sec
2015-11-26 08:44:36,652 Stage-1 map = 100%,  reduce = 21%, Cumulative CPU 372.06 sec
2015-11-26 08:44:37,815 Stage-1 map = 100%,  reduce = 22%, Cumulative CPU 378.67 sec
2015-11-26 08:44:38,965 Stage-1 map = 100%,  reduce = 26%, Cumulative CPU 395.57 sec
2015-11-26 08:44:42,157 Stage-1 map = 100%,  reduce = 28%, Cumulative CPU 399.58 sec
2015-11-26 08:44:43,316 Stage-1 map = 100%,  reduce = 29%, Cumulative CPU 400.77 sec
2015-11-26 08:44:49,166 Stage-1 map = 100%,  reduce = 34%, Cumulative CPU 410.33 sec
2015-11-26 08:44:50,268 Stage-1 map = 100%,  reduce = 44%, Cumulative CPU 421.85 sec
2015-11-26 08:44:52,410 Stage-1 map = 100%,  reduce = 45%, Cumulative CPU 425.61 sec
2015-11-26 08:44:53,529 Stage-1 map = 100%,  reduce = 49%, Cumulative CPU 438.86 sec
2015-11-26 08:44:55,858 Stage-1 map = 100%,  reduce = 55%, Cumulative CPU 448.06 sec
2015-11-26 08:44:59,947 Stage-1 map = 100%,  reduce = 56%, Cumulative CPU 454.36 sec
2015-11-26 08:45:01,035 Stage-1 map = 100%,  reduce = 57%, Cumulative CPU 456.64 sec
2015-11-26 08:45:03,329 Stage-1 map = 100%,  reduce = 62%, Cumulative CPU 467.8 sec
2015-11-26 08:45:05,513 Stage-1 map = 100%,  reduce = 70%, Cumulative CPU 482.06 sec
2015-11-26 08:45:07,694 Stage-1 map = 100%,  reduce = 75%, Cumulative CPU 488.39 sec
2015-11-26 08:45:08,784 Stage-1 map = 100%,  reduce = 76%, Cumulative CPU 492.46 sec
2015-11-26 08:45:09,878 Stage-1 map = 100%,  reduce = 78%, Cumulative CPU 498.06 sec
2015-11-26 08:45:13,365 Stage-1 map = 100%,  reduce = 83%, Cumulative CPU 508.01 sec
2015-11-26 08:45:16,403 Stage-1 map = 100%,  reduce = 85%, Cumulative CPU 513.44 sec
2015-11-26 08:45:17,492 Stage-1 map = 100%,  reduce = 90%, Cumulative CPU 522.36 sec
2015-11-26 08:45:19,750 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 539.49 sec
2015-11-26 08:45:23,101 Stage-1 map = 100%,  reduce = 99%, Cumulative CPU 546.49 sec
2015-11-26 08:45:24,163 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 547.38 sec
MapReduce Total cumulative CPU time: 9 minutes 7 seconds 380 msec
Ended Job = job_1448551896589_0015
Launching Job 2 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1448551896589_0016, Tracking URL = http://wn2.kara:8088/proxy/application_1448551896589_0016/
Kill Command = /usr/hdp/2.3.0.0-2557/hadoop/bin/hadoop job  -kill job_1448551896589_0016
Hadoop job information for Stage-2: number of mappers: 2; number of reducers: 1
2015-11-26 08:45:39,686 Stage-2 map = 0%,  reduce = 0%
2015-11-26 08:45:47,820 Stage-2 map = 50%,  reduce = 0%, Cumulative CPU 3.87 sec
2015-11-26 08:45:51,106 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 8.42 sec
2015-11-26 08:45:57,492 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 12.64 sec
MapReduce Total cumulative CPU time: 12 seconds 640 msec
Ended Job = job_1448551896589_0016
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 4  Reduce: 14   Cumulative CPU: 547.38 sec   HDFS Read: 939623574 HDFS Write: 1638 SUCCESS
Stage-Stage-2: Map: 2  Reduce: 1   Cumulative CPU: 12.64 sec   HDFS Read: 11030 HDFS Write: 8 SUCCESS
Total MapReduce CPU Time Spent: 9 minutes 20 seconds 20 msec
OK
2097152
Time taken: 197.499 seconds, Fetched: 1 row(s)


hive> explain select count(*) from 
    > (select 
    > item_id,material_number,material_type,industry_sector,material_group,base_unit_of_measure,order_unit,
    > material_xx1,material_xx2,material_xx3,material_xx4,material_xx5,material_xx6,material_xx7,material_xx8,
    > material_xx9,material_xx10,material_xx11,material_xx12,material_xx13,material_xx14,material_xx15,material_xx16,
    > material_xx17,material_xx18,material_xx19,material_xx20,material_xx21,eff_from_date,eff_to_date 
    > from  d_Item2 group by 
    > item_id,material_number,material_type,industry_sector,material_group,base_unit_of_measure,order_unit,
    > material_xx1,material_xx2,material_xx3,material_xx4,material_xx5,material_xx6,material_xx7,
    > material_xx8,material_xx9,material_xx10,material_xx11,material_xx12,material_xx13,material_xx14,material_xx15,
    > material_xx16,material_xx17,material_xx18,material_xx19,material_xx20,material_xx21,eff_from_date,eff_to_date
    > ) MM;
OK


STAGE DEPENDENCIES:
  Stage-1 is a root stage
  Stage-2 depends on stages: Stage-1
  Stage-0 depends on stages: Stage-2

STAGE PLANS:
  Stage: Stage-1
    Map Reduced
      Map Operator Tree:
          TableScan
            alias: d_item2
            Statistics: Num rows: 4194304 Data size: 934419322 Basic stats: COMPLETE Column stats: NONE
            Select Operator
              expressions: item_id (type: int), material_number (type: varchar(20)), material_type (type: varchar(50)), industry_sector (type: varchar(50)), material_group (type: varchar(20)), base_unit_of_measure (type: varchar(3)), order_unit (type: varchar(3)), material_xx1 (type: varchar(50)), material_xx2 (type: varchar(50)), material_xx3 (type: varchar(50)), material_xx4 (type: varchar(50)), material_xx5 (type: varchar(50)), material_xx6 (type: varchar(50)), material_xx7 (type: varchar(50)), material_xx8 (type: varchar(50)), material_xx9 (type: varchar(50)), material_xx10 (type: varchar(50)), material_xx11 (type: varchar(50)), material_xx12 (type: varchar(50)), material_xx13 (type: varchar(50)), material_xx14 (type: varchar(50)), material_xx15 (type: varchar(50)), material_xx16 (type: varchar(50)), material_xx17 (type: varchar(50)), material_xx18 (type: varchar(50)), material_xx19 (type: varchar(50)), material_xx20 (type: varchar(50)), material_xx21 (type: varchar(50)), eff_from_date (type: date), eff_to_date (type: date)
              outputColumnNames: item_id, material_number, material_type, industry_sector, material_group, base_unit_of_measure, order_unit, material_xx1, material_xx2, material_xx3, material_xx4, material_xx5, material_xx6, material_xx7, material_xx8, material_xx9, material_xx10, material_xx11, material_xx12, material_xx13, material_xx14, material_xx15, material_xx16, material_xx17, material_xx18, material_xx19, material_xx20, material_xx21, eff_from_date, eff_to_date
              Statistics: Num rows: 4194304 Data size: 934419322 Basic stats: COMPLETE Column stats: NONE
              Group By Operator
                keys: item_id (type: int), material_number (type: varchar(20)), material_type (type: varchar(50)), industry_sector (type: varchar(50)), material_group (type: varchar(20)), base_unit_of_measure (type: varchar(3)), order_unit (type: varchar(3)), material_xx1 (type: varchar(50)), material_xx2 (type: varchar(50)), material_xx3 (type: varchar(50)), material_xx4 (type: varchar(50)), material_xx5 (type: varchar(50)), material_xx6 (type: varchar(50)), material_xx7 (type: varchar(50)), material_xx8 (type: varchar(50)), material_xx9 (type: varchar(50)), material_xx10 (type: varchar(50)), material_xx11 (type: varchar(50)), material_xx12 (type: varchar(50)), material_xx13 (type: varchar(50)), material_xx14 (type: varchar(50)), material_xx15 (type: varchar(50)), material_xx16 (type: varchar(50)), material_xx17 (type: varchar(50)), material_xx18 (type: varchar(50)), material_xx19 (type: varchar(50)), material_xx20 (type: varchar(50)), material_xx21 (type: varchar(50)), eff_from_date (type: date), eff_to_date (type: date)
                mode: hash
                outputColumnNames: _col0, _col1, _col2, _col3, _col4, _col5, _col6, _col7, _col8, _col9, _col10, _col11, _col12, _col13, _col14, _col15, _col16, _col17, _col18, _col19, _col20, _col21, _col22, _col23, _col24, _col25, _col26, _col27, _col28, _col29
                Statistics: Num rows: 4194304 Data size: 934419322 Basic stats: COMPLETE Column stats: NONE
                Reduce Output Operator
                  key expressions: _col0 (type: int), _col1 (type: varchar(20)), _col2 (type: varchar(50)), _col3 (type: varchar(50)), _col4 (type: varchar(20)), _col5 (type: varchar(3)), _col6 (type: varchar(3)), _col7 (type: varchar(50)), _col8 (type: varchar(50)), _col9 (type: varchar(50)), _col10 (type: varchar(50)), _col11 (type: varchar(50)), _col12 (type: varchar(50)), _col13 (type: varchar(50)), _col14 (type: varchar(50)), _col15 (type: varchar(50)), _col16 (type: varchar(50)), _col17 (type: varchar(50)), _col18 (type: varchar(50)), _col19 (type: varchar(50)), _col20 (type: varchar(50)), _col21 (type: varchar(50)), _col22 (type: varchar(50)), _col23 (type: varchar(50)), _col24 (type: varchar(50)), _col25 (type: varchar(50)), _col26 (type: varchar(50)), _col27 (type: varchar(50)), _col28 (type: date), _col29 (type: date)
                  sort order: ++++++++++++++++++++++++++++++
                  Map-reduce partition columns: _col0 (type: int), _col1 (type: varchar(20)), _col2 (type: varchar(50)), _col3 (type: varchar(50)), _col4 (type: varchar(20)), _col5 (type: varchar(3)), _col6 (type: varchar(3)), _col7 (type: varchar(50)), _col8 (type: varchar(50)), _col9 (type: varchar(50)), _col10 (type: varchar(50)), _col11 (type: varchar(50)), _col12 (type: varchar(50)), _col13 (type: varchar(50)), _col14 (type: varchar(50)), _col15 (type: varchar(50)), _col16 (type: varchar(50)), _col17 (type: varchar(50)), _col18 (type: varchar(50)), _col19 (type: varchar(50)), _col20 (type: varchar(50)), _col21 (type: varchar(50)), _col22 (type: varchar(50)), _col23 (type: varchar(50)), _col24 (type: varchar(50)), _col25 (type: varchar(50)), _col26 (type: varchar(50)), _col27 (type: varchar(50)), _col28 (type: date), _col29 (type: date)
                  Statistics: Num rows: 4194304 Data size: 934419322 Basic stats: COMPLETE Column stats: NONE
      Reduce Operator Tree:
        Group By Operator
          keys: KEY._col0 (type: int), KEY._col1 (type: varchar(20)), KEY._col2 (type: varchar(50)), KEY._col3 (type: varchar(50)), KEY._col4 (type: varchar(20)), KEY._col5 (type: varchar(3)), KEY._col6 (type: varchar(3)), KEY._col7 (type: varchar(50)), KEY._col8 (type: varchar(50)), KEY._col9 (type: varchar(50)), KEY._col10 (type: varchar(50)), KEY._col11 (type: varchar(50)), KEY._col12 (type: varchar(50)), KEY._col13 (type: varchar(50)), KEY._col14 (type: varchar(50)), KEY._col15 (type: varchar(50)), KEY._col16 (type: varchar(50)), KEY._col17 (type: varchar(50)), KEY._col18 (type: varchar(50)), KEY._col19 (type: varchar(50)), KEY._col20 (type: varchar(50)), KEY._col21 (type: varchar(50)), KEY._col22 (type: varchar(50)), KEY._col23 (type: varchar(50)), KEY._col24 (type: varchar(50)), KEY._col25 (type: varchar(50)), KEY._col26 (type: varchar(50)), KEY._col27 (type: varchar(50)), KEY._col28 (type: date), KEY._col29 (type: date)
          mode: mergepartial
          outputColumnNames: _col0, _col1, _col2, _col3, _col4, _col5, _col6, _col7, _col8, _col9, _col10, _col11, _col12, _col13, _col14, _col15, _col16, _col17, _col18, _col19, _col20, _col21, _col22, _col23, _col24, _col25, _col26, _col27, _col28, _col29
          Statistics: Num rows: 2097152 Data size: 467209661 Basic stats: COMPLETE Column stats: NONE
          Select Operator
            Statistics: Num rows: 2097152 Data size: 467209661 Basic stats: COMPLETE Column stats: NONE
            Group By Operator
              aggregations: count()
              mode: hash
              outputColumnNames: _col0
              Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
              File Output Operator
                compressed: false
                table:
                    input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                    output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                    serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              sort order: 
              Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          mode: mergepartial
          outputColumnNames: _col0
          Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.474 seconds, Fetched: 74 row(s)



----------Populate duplicate data and de-duplicate it -----------------------



--------Explain plan -------

hive> explain select I.item_id from d_item I join f_invoice N on I.item_id = N.item_id;
OK
STAGE DEPENDENCIES:
  Stage-5 is a root stage , consists of Stage-1
  Stage-1
  Stage-0 depends on stages: Stage-1

STAGE PLANS:
  Stage: Stage-5
    Conditional Operator

  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: i
            filterExpr: item_id is not null (type: boolean)
            Statistics: Num rows: 119512704 Data size: 478050816 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: item_id is not null (type: boolean)
              Statistics: Num rows: 59756352 Data size: 239025408 Basic stats: COMPLETE Column stats: NONE
              Reduce Output Operator
                key expressions: item_id (type: int)
                sort order: +
                Map-reduce partition columns: item_id (type: int)
                Statistics: Num rows: 59756352 Data size: 239025408 Basic stats: COMPLETE Column stats: NONE
          TableScan
            alias: n
            filterExpr: item_id is not null (type: boolean)
            Statistics: Num rows: 150413312 Data size: 601653248 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: item_id is not null (type: boolean)
              Statistics: Num rows: 75206656 Data size: 300826624 Basic stats: COMPLETE Column stats: NONE
              Reduce Output Operator
                key expressions: item_id (type: int)
                sort order: +
                Map-reduce partition columns: item_id (type: int)
                Statistics: Num rows: 75206656 Data size: 300826624 Basic stats: COMPLETE Column stats: NONE
      Reduce Operator Tree:
        Join Operator
          condition map:
               Inner Join 0 to 1
          keys:
            0 item_id (type: int)
            1 item_id (type: int)
          outputColumnNames: _col0
          Statistics: Num rows: 82727323 Data size: 330909293 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            Statistics: Num rows: 82727323 Data size: 330909293 Basic stats: COMPLETE Column stats: NONE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.853 seconds, Fetched: 59 row(s)
hive> 


hive> explain select count(*) from onecol;
OK
STAGE DEPENDENCIES:
  Stage-1 is a root stage
  Stage-0 depends on stages: Stage-1

STAGE PLANS:
  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: onecol
            Statistics: Num rows: 1 Data size: 0 Basic stats: PARTIAL Column stats: COMPLETE
            Select Operator
              Statistics: Num rows: 1 Data size: 0 Basic stats: PARTIAL Column stats: COMPLETE
              Group By Operator
                aggregations: count()
                mode: hash
                outputColumnNames: _col0
                Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
                Reduce Output Operator
                  sort order: 
                  Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
                  value expressions: _col0 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          mode: mergepartial
          outputColumnNames: _col0
          Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.285 seconds, Fetched: 42 row(s)
hive> 



hive> explain select count(*) from (
    > select I.item_id from d_item I join f_invoice N on I.item_id = N.item_id
    > )AA  ;
OK
STAGE DEPENDENCIES:
  Stage-6 is a root stage , consists of Stage-1
  Stage-1
  Stage-2 depends on stages: Stage-1
  Stage-0 depends on stages: Stage-2

STAGE PLANS:
  Stage: Stage-6
    Conditional Operator

  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: i
            filterExpr: item_id is not null (type: boolean)
            Statistics: Num rows: 119512704 Data size: 478050816 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: item_id is not null (type: boolean)
              Statistics: Num rows: 59756352 Data size: 239025408 Basic stats: COMPLETE Column stats: NONE
              Reduce Output Operator
                key expressions: item_id (type: int)
                sort order: +
                Map-reduce partition columns: item_id (type: int)
                Statistics: Num rows: 59756352 Data size: 239025408 Basic stats: COMPLETE Column stats: NONE
          TableScan
            alias: n
            filterExpr: item_id is not null (type: boolean)
            Statistics: Num rows: 150413312 Data size: 601653248 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: item_id is not null (type: boolean)
              Statistics: Num rows: 75206656 Data size: 300826624 Basic stats: COMPLETE Column stats: NONE
              Reduce Output Operator
                key expressions: item_id (type: int)
                sort order: +
                Map-reduce partition columns: item_id (type: int)
                Statistics: Num rows: 75206656 Data size: 300826624 Basic stats: COMPLETE Column stats: NONE
      Reduce Operator Tree:
        Join Operator
          condition map:
               Inner Join 0 to 1
          keys:
            0 item_id (type: int)
            1 item_id (type: int)
          Statistics: Num rows: 82727323 Data size: 330909293 Basic stats: COMPLETE Column stats: NONE
          Group By Operator
            aggregations: count()
            mode: hash
            outputColumnNames: _col0
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              table:
                  input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              sort order: 
              Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          mode: mergepartial
          outputColumnNames: _col0
          Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.755 seconds, Fetched: 85 row(s)
hive> 


