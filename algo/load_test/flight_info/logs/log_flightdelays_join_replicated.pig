[kannappan@wn2 flight_info]$ cat flightdelays_join_replicated.pig

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

weather = load '/datalake/algo/load_test/flight_info/data/weather' using PigStorage(',') as (Year:int,Month:int,DayofMonth:int,PRCP:int,TMAX:int,TMIN:int);

fd_weather = join fd by (Year,Month,DayofMonth),  weather by (Year,Month,DayofMonth) using 'replicated';


--fd_weather: {fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier: chararray,fd::FlightNum,fd::ArrDelay,fd::Origin: chararray,fd::Dest: chararray,weather::Year,weather::Month,weather::DayofMonth,weather::PRCP,weather::TMAX,weather::TMIN}

fd_weather_final = foreach fd_weather generate fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier,fd::FlightNum,fd::ArrDelay,fd::Origin,fd::Dest,weather::PRCP,weather::TMAX,weather::TMIN;

store fd_weather_final into '/datalake/algo/load_test/flight_info/data/fd_weather_final_replicated' using PigStorage(',');









[kannappan@wn2 flight_info]$ pig flightdelays_join_replicated.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 14:41:42 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 14:41:42 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 14:41:42 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 14:41:42,903 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 14:41:42,904 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448232102900.log
2015-11-22 14:41:44,218 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 14:41:44,485 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 14:41:47,501 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: REPLICATED_JOIN
2015-11-22 14:41:47,597 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 14:41:47,714 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-22 14:41:48,126 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 14:41:48,354 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 14:41:48,362 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 14:41:48,401 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 14:41:48,401 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - number of input files: 1
2015-11-22 14:41:48,442 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 2
2015-11-22 14:41:48,443 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 2
2015-11-22 14:41:51,058 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:41:51,493 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:41:52,069 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 14:41:52,104 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 14:41:52,105 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 14:41:53,203 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-118798327/tmp-483810380/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 14:41:53,338 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-118798327/tmp-1411492490/automaton-1.11-8.jar
2015-11-22 14:41:53,505 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-118798327/tmp-1106318480/antlr-runtime-3.4.jar
2015-11-22 14:41:53,631 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-118798327/tmp1212064529/joda-time-2.8.1.jar
2015-11-22 14:41:53,723 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 14:41:53,735 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 14:41:53,735 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 14:41:53,736 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 14:41:53,801 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 14:41:54,147 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:41:54,149 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:41:54,838 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 14:41:55,019 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 14:41:55,019 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 14:41:55,020 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 14:41:55,539 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 14:41:56,853 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0007
2015-11-22 14:41:57,369 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 14:41:57,761 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0007
2015-11-22 14:41:58,033 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0007/
2015-11-22 14:41:58,033 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0007
2015-11-22 14:41:58,033 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 14:41:58,033 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[33,10],weather[-1,-1] C:  R: 
2015-11-22 14:41:58,063 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-22 14:41:58,063 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0007]
2015-11-22 14:42:35,212 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 25% complete
2015-11-22 14:42:35,212 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0007]
2015-11-22 14:42:38,216 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2015-11-22 14:42:38,433 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:42:38,433 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:42:38,444 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:42:39,234 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:42:39,235 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:42:39,250 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:42:39,584 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:42:39,585 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:42:39,591 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:42:39,772 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 14:42:39,780 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 14:42:39,781 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 14:42:40,300 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-118798327/tmp561217216/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 14:42:40,566 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-118798327/tmp-1283781582/automaton-1.11-8.jar
2015-11-22 14:42:40,775 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-118798327/tmp726224752/antlr-runtime-3.4.jar
2015-11-22 14:42:40,901 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-118798327/tmp1857464528/joda-time-2.8.1.jar
2015-11-22 14:42:40,922 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 14:42:40,931 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 14:42:40,931 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 14:42:40,931 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 14:42:40,991 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 14:42:41,287 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:42:41,288 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:42:41,449 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 14:42:41,578 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 40
2015-11-22 14:42:41,580 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 40
2015-11-22 14:42:41,609 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 14
2015-11-22 14:42:41,933 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:14
2015-11-22 14:42:42,124 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0008
2015-11-22 14:42:42,134 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 14:42:42,636 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0008
2015-11-22 14:42:42,646 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0008/
2015-11-22 14:42:42,647 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0008
2015-11-22 14:42:42,647 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd,fd_weather,fd_weather_final
2015-11-22 14:42:42,647 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[31,5],fd[-1,-1],fd_weather[35,13],fd_weather_final[40,19] C:  R: 
2015-11-22 14:44:10,748 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 54% complete
2015-11-22 14:44:10,749 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]
2015-11-22 14:44:42,725 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 58% complete
2015-11-22 14:44:42,726 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]

^[[A^[[A^[[A2015-11-22 14:45:25,787 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 62% complete
2015-11-22 14:45:25,787 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]
sortsortsortsortsort2015-11-22 14:46:10,856 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 66% complete
2015-11-22 14:46:10,856 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]
2015-11-22 14:46:55,922 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 70% complete
2015-11-22 14:46:55,923 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]
2015-11-22 14:48:58,601 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 74% complete
2015-11-22 14:48:58,601 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0008]
2015-11-22 14:49:09,297 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:09,298 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:09,313 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:09,868 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:09,868 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:09,874 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:10,287 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:10,288 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:10,295 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:10,402 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-22 14:49:10,467 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-22 14:41:52	2015-11-22 14:49:10	REPLICATED_JOIN

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448214558608_0007	1	0	25	25	25	25	0	0	0	0	weather	MAP_ONLY	
job_1448214558608_0008	14	0	352	41	255	232	0	0	0	0	fd,fd_weather,fd_weather_final	REPLICATED_JOIN,MAP_ONLY	/datalake/algo/load_test/flight_info/data/fd_weather_final_replicated,

Input(s):
Successfully read 366 records (7583 bytes) from: "/datalake/algo/load_test/flight_info/data/weather"
Successfully read 55226298 records (1774139653 bytes) from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"

Output(s):
Successfully stored 55226298 records (2379374457 bytes) in: "/datalake/algo/load_test/flight_info/data/fd_weather_final_replicated"

Counters:
Total records written : 55226298
Total bytes written : 2379374457
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1448214558608_0007	->	job_1448214558608_0008,
job_1448214558608_0008


2015-11-22 14:49:10,621 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:10,622 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:10,626 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:10,806 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:10,807 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:10,811 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:10,984 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:10,986 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:10,994 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:11,265 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:11,266 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:11,274 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:11,569 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:11,570 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:11,584 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:11,826 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:49:11,826 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:49:11,830 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:49:11,903 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 145982 time(s).
2015-11-22 14:49:11,903 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-22 14:49:11,951 [main] INFO  org.apache.pig.Main - Pig script completed in 7 minutes, 29 seconds and 640 milliseconds (449640 ms)

