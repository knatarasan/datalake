This is a log from the outcome of load test on file

[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/
Found 2 items
-rw-r--r--   3 kannappan hdfs 4979816688 2015-11-21 07:20 /datalake/algo/load_test/flight_info/data/flight_delays0.csv

Year,Month,DayofMonth,DayOfWeek,DepTime,CRSDepTime,ArrTime,CRSArrTime,UniqueCarrier,FlightNum,TailNum,ActualElapsedTime,CRSElapsedTime,AirTime,ArrDelay,DepDelay,Origin,Dest,Distance,TaxiIn,TaxiOut,Cancelled,CancellationCode,Diverted,CarrierDelay,WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay
2008,1,3,4,2003,1955,2211,2225,WN,335,N712SW,128,150,116,-14,8,IAD,TPA,810,4,8,0,,0,NA,NA,NA,NA,NA
2008,1,3,4,754,735,1002,1000,WN,3231,N772SW,128,145,113,2,19,IAD,TPA,810,5,10,0,,0,NA,NA,NA,NA,NA
2008,1,3,4,628,620,804,750,WN,448,N428WN,96,90,76,14,8,IND,BWI,515,3,17,0,,0,NA,NA,NA,NA,NA
2008,1,3,4,926,930,1054,1100,WN,1746,N612SW,88,90,78,-6,-4,IND,BWI,515,3,7,0,,0,NA,NA,NA,NA,NA


** around 5 GB ***

---------------------pig script -----------------------------

[kannappan@wn2 flight_info]$ cat flightdelays_clean.pig

fd = load '/datalake/algo/load_test/flight_info/data/' using PigStorage(',') as (Year:chararray, Month:chararray, DayofMonth:chararray, DayOfWeek:chararray, DepTime:chararray, CRSDepTime:chararray, ArrTime:chararray, CRSArrTime:chararray,
UniqueCarrier:chararray, FlightNum:chararray, TailNum:chararray, ActualElapsedTime:chararray, CRSElapsedTime:chararray, AirTime:chararray,
ArrDelay:chararray, DepDelay:chararray, Origin:chararray, Dest:chararray, Distance:chararray, TaxiIn:chararray, TaxiOut:chararray, Cancelled:chararray, 
CancellationCode:chararray, Diverted:chararray, CarrierDelay:chararray, WeatherDelay:chararray, NASDelay:chararray, SecurityDelay:chararray,
LateAircraftDelay:chararray  );

fd_fil = filter fd by DepTime !='NA';

fd_final = foreach fd_fil generate Year, Month, DayofMonth, DepTime, UniqueCarrier, FlightNum, ArrDelay, Origin , Dest;

store fd_final into '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',');

---------------------pig script -----------------------------



[kannappan@wn2 flight_info]$ pig flightdelays_clean.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/21 07:25:37 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/21 07:25:37 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/21 07:25:37 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-21 07:25:37,982 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-21 07:25:37,982 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448119537979.log
2015-11-21 07:25:39,202 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-21 07:25:39,538 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-21 07:25:42,457 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: FILTER
2015-11-21 07:25:42,637 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-21 07:25:42,753 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-21 07:25:42,877 [main] INFO  org.apache.pig.newplan.logical.rules.ColumnPruneVisitor - Columns pruned for fd: $3, $5, $6, $7, $10, $11, $12, $13, $15, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28
2015-11-21 07:25:43,148 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-21 07:25:43,226 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2015-11-21 07:25:43,226 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2015-11-21 07:25:45,399 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:25:46,191 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:25:46,774 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-21 07:25:46,788 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-21 07:25:46,806 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-21 07:25:47,955 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-2138295511/tmp-394269266/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-21 07:25:48,076 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-2138295511/tmp-213518345/automaton-1.11-8.jar
2015-11-21 07:25:48,177 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-2138295511/tmp-1009388654/antlr-runtime-3.4.jar
2015-11-21 07:25:48,301 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-2138295511/tmp226851852/joda-time-2.8.1.jar
2015-11-21 07:25:48,377 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-21 07:25:48,418 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-21 07:25:48,418 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-21 07:25:48,418 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-21 07:25:48,514 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-21 07:25:48,766 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:25:48,768 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:25:49,275 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-21 07:25:49,493 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-21 07:25:49,493 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-21 07:25:49,542 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 38
2015-11-21 07:25:49,884 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:38
2015-11-21 07:25:50,726 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448117976025_0001
2015-11-21 07:25:51,548 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-21 07:25:52,169 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448117976025_0001
2015-11-21 07:25:52,674 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448117976025_0001/
2015-11-21 07:25:52,674 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448117976025_0001
2015-11-21 07:25:52,674 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd,fd_fil,fd_final
2015-11-21 07:25:52,674 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[2,5],fd[-1,-1],fd_fil[8,9],fd_final[10,11] C:  R: 
2015-11-21 07:25:52,717 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-21 07:25:52,718 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:26:58,171 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 4% complete
2015-11-21 07:26:58,171 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:27:10,060 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 8% complete
2015-11-21 07:27:10,060 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:27:22,396 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 13% complete
2015-11-21 07:27:22,396 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:27:32,405 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 17% complete
2015-11-21 07:27:32,405 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:27:45,636 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 22% complete
2015-11-21 07:27:45,636 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:27:58,217 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 26% complete
2015-11-21 07:27:58,217 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:28:09,479 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 30% complete
2015-11-21 07:28:09,479 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:28:23,219 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 34% complete
2015-11-21 07:28:23,219 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:28:36,260 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 39% complete
2015-11-21 07:28:36,260 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:28:53,365 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 43% complete
2015-11-21 07:28:53,366 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:29:21,544 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 48% complete
2015-11-21 07:29:21,544 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0001]
2015-11-21 07:29:40,137 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:40,138 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:40,151 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:43,203 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:43,203 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:43,211 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:43,569 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:43,569 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:43,574 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:43,678 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-21 07:29:43,682 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-21 07:25:46	2015-11-21 07:29:43	FILTER

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448117976025_0001	38	0	146	20	89	82	0	0	0	0	fd,fd_fil,fd_final	MAP_ONLY	/datalake/algo/load_test/flight_info/data/flightdelays_clean,

Input(s):
Successfully read 52074792 records (4984681818 bytes) from: "/datalake/algo/load_test/flight_info/data"

Output(s):
Successfully stored 51225888 records (1645618632 bytes) in: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"

Counters:
Total records written : 51225888
Total bytes written : 1645618632
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1448117976025_0001


2015-11-21 07:29:43,970 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:43,971 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:43,992 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:44,314 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:44,314 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:44,350 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:44,883 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 07:29:44,883 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 07:29:44,891 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 07:29:45,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-21 07:29:45,144 [main] INFO  org.apache.pig.Main - Pig script completed in 4 minutes, 7 seconds and 619 milliseconds (247619 ms)

drwxr-xr-x   - kannappan hdfs          0 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean
[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/flightdelays_clean
Found 39 items
-rw-r--r--   3 kannappan hdfs          0 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/_SUCCESS
-rw-r--r--   3 kannappan hdfs   44353738 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00000
-rw-r--r--   3 kannappan hdfs   44352533 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00001
-rw-r--r--   3 kannappan hdfs   44353723 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00002
-rw-r--r--   3 kannappan hdfs   44353355 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00003
-rw-r--r--   3 kannappan hdfs   44352613 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00004
-rw-r--r--   3 kannappan hdfs   44353949 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00005
-rw-r--r--   3 kannappan hdfs   44352472 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00006
-rw-r--r--   3 kannappan hdfs   44353732 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00007
-rw-r--r--   3 kannappan hdfs   44353833 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00008
-rw-r--r--   3 kannappan hdfs   44352502 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00009
-rw-r--r--   3 kannappan hdfs   44353797 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00010
-rw-r--r--   3 kannappan hdfs   44353387 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00011
-rw-r--r--   3 kannappan hdfs   44352728 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00012
-rw-r--r--   3 kannappan hdfs   44353777 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00013
-rw-r--r--   3 kannappan hdfs   44353020 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00014
-rw-r--r--   3 kannappan hdfs   44353030 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00015
-rw-r--r--   3 kannappan hdfs   44353867 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00016
-rw-r--r--   3 kannappan hdfs   44352504 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00017
-rw-r--r--   3 kannappan hdfs   44353654 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00018
-rw-r--r--   3 kannappan hdfs   44353824 2015-11-21 07:27 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00019
-rw-r--r--   3 kannappan hdfs   44352476 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00020
-rw-r--r--   3 kannappan hdfs   44353821 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00021
-rw-r--r--   3 kannappan hdfs   44353301 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00022
-rw-r--r--   3 kannappan hdfs   44352540 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00023
-rw-r--r--   3 kannappan hdfs   44353971 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00024
-rw-r--r--   3 kannappan hdfs   44352582 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00025
-rw-r--r--   3 kannappan hdfs   44353611 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00026
-rw-r--r--   3 kannappan hdfs   44353903 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00027
-rw-r--r--   3 kannappan hdfs   44352425 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00028
-rw-r--r--   3 kannappan hdfs   44353877 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00029
-rw-r--r--   3 kannappan hdfs   44353388 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00030
-rw-r--r--   3 kannappan hdfs   44352670 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00031
-rw-r--r--   3 kannappan hdfs   44353820 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00032
-rw-r--r--   3 kannappan hdfs   44353212 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00033
-rw-r--r--   3 kannappan hdfs   44352777 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00034
-rw-r--r--   3 kannappan hdfs   44353904 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00035
-rw-r--r--   3 kannappan hdfs   44352499 2015-11-21 07:29 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00036
-rw-r--r--   3 kannappan hdfs    4547817 2015-11-21 07:28 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00037

