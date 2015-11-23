[kannappan@wn2 flight_info]$ cat flightdelays_join_order.pig

/*
fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

flight_delay_clean
------------------
Year, Month, DayofMonth, DepTime,UniqueCarrier, FlightNum, ArrDelay, Origin , Dest;
2008,1,5,1018,WN,3668,22,BUR,OAK
2008,1,5,1038,WN,320,8,BUR,PHX
2008,1,5,2131,WN,444,54,BUR,PHX

SFO_WEATHER
-----------

/datalake/algo/load_test/flight_info/data/weather/weather.csv

YEAR,MONTH,DAY,PRCP,TMAX,TMIN
2008,1,1,0,122,39
2008,1,2,0,117,39
2008,1,3,43,150,94
2008,1,5,533,150,100

Expected output

2008,1,5,1018,WN,3668,22,BUR,OAK,533,150,100
2008,1,5,1038,WN,320,8,BUR,PHX,533,150,100
2008,1,5,2131,WN,444,54,BUR,PHX,533,150,100
*/


fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean/' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd = order fd by Year, Month, DayofMonth;

weather = load '/datalake/algo/load_test/flight_info/data/weather' using PigStorage(',') as (Year:int,Month:int,DayofMonth:int,PRCP:int,TMAX:int,TMIN:int);

weather = order weather by Year, Month, DayofMonth;

fd_weather = join fd by (Year,Month,DayofMonth),  weather by (Year,Month,DayofMonth);


fd_weather_final = foreach fd_weather generate fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier,fd::FlightNum,fd::ArrDelay,fd::Origin,fd::Dest,weather::PRCP,weather::TMAX,weather::TMIN;

store fd_weather_final into '/datalake/algo/load_test/flight_info/data/fd_weather_final_merge' using PigStorage(',');




[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/flightdelays_clean/
Found 21 items
-rw-r--r--   3 kannappan hdfs          0 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/_SUCCESS
-rw-r--r--   3 kannappan hdfs   44353738 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00000
-rw-r--r--   3 kannappan hdfs   44352533 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00001
-rw-r--r--   3 kannappan hdfs   44353723 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00002
-rw-r--r--   3 kannappan hdfs   44353355 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00003
-rw-r--r--   3 kannappan hdfs   44352613 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00004
-rw-r--r--   3 kannappan hdfs   44353949 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00005
-rw-r--r--   3 kannappan hdfs   44352472 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00006
-rw-r--r--   3 kannappan hdfs   44353732 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00007
-rw-r--r--   3 kannappan hdfs   44353833 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00008
-rw-r--r--   3 kannappan hdfs   44352502 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00009
-rw-r--r--   3 kannappan hdfs   44353797 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00010
-rw-r--r--   3 kannappan hdfs   44353387 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00011
-rw-r--r--   3 kannappan hdfs   44352728 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00012
-rw-r--r--   3 kannappan hdfs   44353777 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00013
-rw-r--r--   3 kannappan hdfs   44353020 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00014
-rw-r--r--   3 kannappan hdfs   44353030 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00015
-rw-r--r--   3 kannappan hdfs   44353867 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00016
-rw-r--r--   3 kannappan hdfs   44352504 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00017
-rw-r--r--   3 kannappan hdfs   44353654 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00018
-rw-r--r--   3 kannappan hdfs   44353824 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00019

[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/weather
Found 1 items
-rw-r--r--   3 kannappan hdfs       7175 2015-11-22 12:51 /datalake/algo/load_test/flight_info/data/weather/weather.csv


[kannappan@wn2 flight_info]$ pig flightdelays_join_merge.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 16:25:06 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 16:25:06 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 16:25:06 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 16:25:06,948 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 16:25:06,949 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448238306928.log
2015-11-22 16:25:08,150 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 16:25:08,414 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 16:25:11,487 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: HASH_JOIN,ORDER_BY
2015-11-22 16:25:11,605 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 16:25:11,683 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-22 16:25:11,917 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 16:25:12,110 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-105
2015-11-22 16:25:12,110 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-135
2015-11-22 16:25:12,120 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler$LastInputStreamingOptimizer - Rewrite: POPackage->POForEach to POPackage(JoinPackager)
2015-11-22 16:25:12,134 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 7
2015-11-22 16:25:12,134 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 7
2015-11-22 16:25:13,507 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:13,852 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:14,550 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:25:14,564 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:25:14,576 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:25:15,901 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp-1551813623/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:25:15,999 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp-2066625727/automaton-1.11-8.jar
2015-11-22 16:25:16,066 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp-407932463/antlr-runtime-3.4.jar
2015-11-22 16:25:16,181 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp627977229/joda-time-2.8.1.jar
2015-11-22 16:25:16,264 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:25:16,294 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:25:16,296 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:25:16,297 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:25:16,407 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:25:16,407 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:25:16,408 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:25:16,882 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp225319539/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:25:17,023 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp-61455916/automaton-1.11-8.jar
2015-11-22 16:25:17,098 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp1355609040/antlr-runtime-3.4.jar
2015-11-22 16:25:17,207 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp-395867639/joda-time-2.8.1.jar
2015-11-22 16:25:17,234 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:25:17,235 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:25:17,236 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:25:17,236 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:25:17,292 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 16:25:17,587 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:17,588 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:18,033 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:25:18,302 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 20
2015-11-22 16:25:18,302 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 20
2015-11-22 16:25:18,412 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 7
2015-11-22 16:25:18,664 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:7
2015-11-22 16:25:19,031 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0025
2015-11-22 16:25:19,509 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:25:20,123 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0025
2015-11-22 16:25:20,799 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0025/
2015-11-22 16:25:20,801 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0025
2015-11-22 16:25:20,802 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 16:25:20,802 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[31,5],fd[-1,-1] C:  R: 
2015-11-22 16:25:21,112 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:21,113 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:21,198 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:25:21,286 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 16:25:21,286 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 16:25:21,286 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 16:25:21,523 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 16:25:21,648 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0026
2015-11-22 16:25:21,656 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:25:21,915 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0026
2015-11-22 16:25:21,923 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0026/
2015-11-22 16:25:21,923 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0026
2015-11-22 16:25:21,923 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 16:25:21,923 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[35,10],weather[-1,-1] C:  R: 
2015-11-22 16:25:21,966 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-22 16:25:21,966 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0025,job_1448214558608_0026]
2015-11-22 16:25:38,996 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 7% complete
2015-11-22 16:25:38,997 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0025,job_1448214558608_0026]
2015-11-22 16:25:42,013 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 14% complete
2015-11-22 16:25:42,013 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0025]
2015-11-22 16:25:42,208 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:42,209 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:42,216 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:25:42,829 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:42,830 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:42,835 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:25:43,217 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:25:43,217 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:25:43,223 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
^[[B2015-11-22 16:26:36,727 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 18% complete
2015-11-22 16:26:36,727 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0025]
2015-11-22 16:27:37,982 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 28% complete
2015-11-22 16:27:38,134 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:27:38,134 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:27:38,143 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:27:38,399 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:27:38,399 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:27:38,406 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:27:38,700 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:27:38,700 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:27:38,706 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:27:38,780 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:27:38,781 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:27:38,782 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 16:27:38,785 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 16:27:38,800 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=6281
2015-11-22 16:27:38,804 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 16:27:38,804 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:27:39,383 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp-16130383/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:27:39,615 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp-1700193664/automaton-1.11-8.jar
2015-11-22 16:27:39,674 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp-131443408/antlr-runtime-3.4.jar
2015-11-22 16:27:39,882 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp-296166874/joda-time-2.8.1.jar
2015-11-22 16:27:39,900 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:27:39,902 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:27:39,903 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:27:39,903 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:27:39,990 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:27:39,991 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:27:39,992 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 16:27:39,992 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 16:27:40,000 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=962845125
2015-11-22 16:27:40,002 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 16:27:40,002 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:27:40,507 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp-2114165684/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:27:40,649 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp-92602316/automaton-1.11-8.jar
2015-11-22 16:27:40,716 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp-1934048436/antlr-runtime-3.4.jar
2015-11-22 16:27:40,824 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp7932755/joda-time-2.8.1.jar
2015-11-22 16:27:40,842 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:27:40,843 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:27:40,843 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:27:40,843 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:27:40,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 16:27:41,012 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:27:41,013 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:27:41,073 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:27:41,166 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 16:27:41,166 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 16:27:41,167 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 16:27:41,299 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 16:27:41,516 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0027
2015-11-22 16:27:41,523 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:27:42,176 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0027
2015-11-22 16:27:42,179 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0027/
2015-11-22 16:27:42,180 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0027
2015-11-22 16:27:42,180 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 16:27:42,180 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[37,10] C:  R: 
2015-11-22 16:27:42,309 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:27:42,310 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:27:42,357 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:27:42,418 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 7
2015-11-22 16:27:42,418 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 7
2015-11-22 16:27:42,418 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 7
2015-11-22 16:27:42,782 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:7
2015-11-22 16:27:42,949 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0028
2015-11-22 16:27:42,955 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:27:43,650 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0028
2015-11-22 16:27:43,659 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0028/
2015-11-22 16:27:43,659 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0028
2015-11-22 16:27:43,659 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 16:27:43,659 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[33,5] C:  R: 
2015-11-22 16:28:03,778 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 36% complete
2015-11-22 16:28:03,778 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0027,job_1448214558608_0028]
2015-11-22 16:28:11,809 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 44% complete
2015-11-22 16:28:11,810 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0027,job_1448214558608_0028]
2015-11-22 16:28:14,987 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:14,988 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:14,993 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:16,197 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:16,197 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:16,202 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:16,395 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:16,395 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:16,399 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:42,002 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 49% complete
2015-11-22 16:28:42,002 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0028]
2015-11-22 16:28:47,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 57% complete
2015-11-22 16:28:47,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0028]
2015-11-22 16:28:50,172 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:50,172 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:50,182 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:50,514 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:50,514 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:50,519 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:50,662 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:50,662 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:50,667 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:28:50,709 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:28:50,709 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:28:50,710 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 16:28:50,710 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 16:28:50,710 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:28:51,196 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp4476890/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:28:51,345 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp-2086088299/automaton-1.11-8.jar
2015-11-22 16:28:51,428 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp-1507781628/antlr-runtime-3.4.jar
2015-11-22 16:28:51,537 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp115174186/joda-time-2.8.1.jar
2015-11-22 16:28:51,552 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:28:51,553 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:28:51,553 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:28:51,554 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:28:51,620 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:28:51,620 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:28:51,621 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 16:28:51,621 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 16:28:51,621 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:28:52,112 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp455189376/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:28:52,178 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp2003754295/automaton-1.11-8.jar
2015-11-22 16:28:52,262 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp-1768218652/antlr-runtime-3.4.jar
2015-11-22 16:28:52,370 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp760700737/joda-time-2.8.1.jar
2015-11-22 16:28:52,382 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:28:52,382 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:28:52,382 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:28:52,382 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:28:52,401 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 16:28:52,507 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:52,507 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:52,554 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:28:52,609 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 7
2015-11-22 16:28:52,609 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 7
2015-11-22 16:28:52,609 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 7
2015-11-22 16:28:52,887 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:7
2015-11-22 16:28:52,995 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0029
2015-11-22 16:28:53,002 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:28:53,648 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0029
2015-11-22 16:28:53,651 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0029/
2015-11-22 16:28:53,651 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0029
2015-11-22 16:28:53,651 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 16:28:53,651 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[33,5] C:  R: 
2015-11-22 16:28:53,819 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:28:53,819 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:28:53,937 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:28:54,017 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 16:28:54,017 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 16:28:54,018 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 16:28:54,930 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 16:28:55,162 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0030
2015-11-22 16:28:55,168 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:28:55,617 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0030
2015-11-22 16:28:55,620 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0030/
2015-11-22 16:28:55,620 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0030
2015-11-22 16:28:55,620 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 16:28:55,620 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[37,10] C:  R: 
2015-11-22 16:29:31,640 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 64% complete
2015-11-22 16:29:31,640 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0029,job_1448214558608_0030]
2015-11-22 16:29:41,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 71% complete
2015-11-22 16:29:41,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0029,job_1448214558608_0030]
2015-11-22 16:29:46,817 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:29:46,818 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:29:46,822 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:29:47,052 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:29:47,052 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:29:47,056 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:29:47,233 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:29:47,233 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:29:47,237 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:30:21,368 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 75% complete
2015-11-22 16:30:21,368 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0029]
2015-11-22 16:33:20,411 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 80% complete
2015-11-22 16:33:20,411 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0029]
2015-11-22 16:35:13,555 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 84% complete
2015-11-22 16:35:13,555 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0029]
2015-11-22 16:38:06,804 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:38:06,805 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:38:06,812 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:38:07,309 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:38:07,310 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:38:07,315 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:38:07,478 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:38:07,478 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:38:07,481 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:38:07,523 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 16:38:07,524 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 16:38:07,524 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 16:38:07,524 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 16:38:07,533 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=962851406
2015-11-22 16:38:07,533 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 16:38:07,533 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 16:38:08,114 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1745091786/tmp1131356087/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 16:38:08,222 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1745091786/tmp1209478407/automaton-1.11-8.jar
2015-11-22 16:38:08,322 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1745091786/tmp2128484997/antlr-runtime-3.4.jar
2015-11-22 16:38:08,439 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1745091786/tmp-2073829441/joda-time-2.8.1.jar
2015-11-22 16:38:08,482 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 16:38:08,506 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 16:38:08,506 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 16:38:08,507 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 16:38:08,648 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 16:38:08,752 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:38:08,752 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:38:08,814 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 16:38:08,865 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 16:38:08,865 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 16:38:08,865 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 8
2015-11-22 16:38:08,872 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 16:38:08,873 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 16:38:08,873 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 16:38:08,997 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:9
2015-11-22 16:38:09,163 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0031
2015-11-22 16:38:09,168 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 16:38:09,605 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0031
2015-11-22 16:38:09,608 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0031/
2015-11-22 16:38:09,608 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0031
2015-11-22 16:38:09,609 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd_weather,fd_weather_final
2015-11-22 16:38:09,609 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd_weather[39,13],fd_weather[39,13] C:  R: fd_weather_final[42,19]
2015-11-22 16:39:34,346 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 88% complete
2015-11-22 16:39:34,347 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0031]
2015-11-22 16:40:04,386 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 92% complete
2015-11-22 16:40:04,386 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0031]
2015-11-22 16:41:21,986 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 97% complete
2015-11-22 16:41:21,986 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0031]
2015-11-22 16:46:22,993 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:22,994 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:23,000 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:23,326 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:23,327 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:23,341 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:23,582 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:23,582 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:23,586 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:23,631 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-22 16:46:24,207 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-22 16:25:14	2015-11-22 16:46:24	HASH_JOIN,ORDER_BY

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448214558608_0025	7	0	118	44	101	117	0	0	0	0	fd	MAP_ONLY	
job_1448214558608_0026	1	0	6	6	6	6	0	0	0	0	weather	MAP_ONLY	
job_1448214558608_0027	1	1	5	5	5	5	4	4	4	4	weather	SAMPLER	
job_1448214558608_0028	7	1	49	8	37	47	39	39	39	39	fd	SAMPLER	
job_1448214558608_0029	7	1	168	26	143	166	488	488	488	488	fd	ORDER_BY	
job_1448214558608_0030	1	1	7	7	7	7	7	7	7	7	weather	ORDER_BY	
job_1448214558608_0031	9	1	72	21	57	66	414	414	414	414	fd_weather,fd_weather_final	HASH_JOIN	/datalake/algo/load_test/flight_info/data/fd_weather_final_merge,

Input(s):
Successfully read 27613173 records (887070460 bytes) from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"
Successfully read 366 records (7583 bytes) from: "/datalake/algo/load_test/flight_info/data/weather"

Output(s):
Successfully stored 27613173 records (1189686994 bytes) in: "/datalake/algo/load_test/flight_info/data/fd_weather_final_merge"

Counters:
Total records written : 27613173
Total bytes written : 1189686994
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 8
Total records proactively spilled: 52195710

Job DAG:
job_1448214558608_0025	->	job_1448214558608_0028,
job_1448214558608_0028	->	job_1448214558608_0029,
job_1448214558608_0029	->	job_1448214558608_0031,
job_1448214558608_0026	->	job_1448214558608_0027,
job_1448214558608_0027	->	job_1448214558608_0030,
job_1448214558608_0030	->	job_1448214558608_0031,
job_1448214558608_0031


2015-11-22 16:46:24,309 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:24,309 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:24,313 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:24,503 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:24,503 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:24,506 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:24,702 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:24,703 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:24,706 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:24,855 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:24,855 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:24,858 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,060 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,060 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,064 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,174 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,174 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,177 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,310 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,311 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,314 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,476 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,477 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,479 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,627 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,627 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,630 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,747 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,747 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,750 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:25,973 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:25,974 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:25,977 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,106 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,106 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,112 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,244 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,244 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,247 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,394 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,394 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,397 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,534 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,534 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,538 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,676 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,677 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,680 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:26,844 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:26,845 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:26,848 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:27,024 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:27,024 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:27,028 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:27,207 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:27,208 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:27,211 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:27,384 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:27,385 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:27,388 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:27,540 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 16:46:27,541 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 16:46:27,547 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 16:46:27,593 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 72987 time(s).
2015-11-22 16:46:27,593 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-22 16:46:27,691 [main] INFO  org.apache.pig.Main - Pig script completed in 21 minutes, 21 seconds and 160 milliseconds (1281160 ms)








