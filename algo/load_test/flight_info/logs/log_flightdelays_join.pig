[kannappan@wn2 flight_info]$ cat flightdelays_join.pig

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

fd_weather = join fd by (Year,Month,DayofMonth),  weather by (Year,Month,DayofMonth) ;


--fd_weather: {fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier: chararray,fd::FlightNum,fd::ArrDelay,fd::Origin: chararray,fd::Dest: chararray,weather::Year,weather::Month,weather::DayofMonth,weather::PRCP,weather::TMAX,weather::TMIN}

fd_weather_final = foreach fd_weather generate fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier,fd::FlightNum,fd::ArrDelay,fd::Origin,fd::Dest,weather::PRCP,weather::TMAX,weather::TMIN;

store fd_weather_final into '/datalake/algo/load_test/flight_info/data/fd_weather_final' using PigStorage(',');









[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/flightdelays_clean/
Found 41 items
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
-rw-r--r--   3 kannappan hdfs   44352476 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00020
-rw-r--r--   3 kannappan hdfs   44353821 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00021
-rw-r--r--   3 kannappan hdfs   44353301 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00022
-rw-r--r--   3 kannappan hdfs   44352540 2015-11-21 08:56 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00023
-rw-r--r--   3 kannappan hdfs   44353971 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00024
-rw-r--r--   3 kannappan hdfs   44352582 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00025
-rw-r--r--   3 kannappan hdfs   44353611 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00026
-rw-r--r--   3 kannappan hdfs   44353903 2015-11-21 08:55 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00027
-rw-r--r--   3 kannappan hdfs   44352425 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00028
-rw-r--r--   3 kannappan hdfs   44353877 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00029
-rw-r--r--   3 kannappan hdfs   44353388 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00030
-rw-r--r--   3 kannappan hdfs   44352670 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00031
-rw-r--r--   3 kannappan hdfs   44353820 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00032
-rw-r--r--   3 kannappan hdfs   44353212 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00033
-rw-r--r--   3 kannappan hdfs   44352777 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00034
-rw-r--r--   3 kannappan hdfs   44353904 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00035
-rw-r--r--   3 kannappan hdfs   44352499 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00036
-rw-r--r--   3 kannappan hdfs   44353738 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00037
-rw-r--r--   3 kannappan hdfs   44352533 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00038
-rw-r--r--   3 kannappan hdfs   44353723 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00039
[kannappan@wn2 flight_info]$ pig flightdelays_join.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 14:07:10 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 14:07:10 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 14:07:10 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 14:07:10,164 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 14:07:10,165 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448230030142.log
2015-11-22 14:07:11,244 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 14:07:11,521 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 14:07:14,256 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: HASH_JOIN
2015-11-22 14:07:14,338 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 14:07:14,439 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-22 14:07:14,724 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 14:07:14,787 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler$LastInputStreamingOptimizer - Rewrite: POPackage->POForEach to POPackage(JoinPackager)
2015-11-22 14:07:14,835 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2015-11-22 14:07:14,835 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2015-11-22 14:07:16,330 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:07:16,793 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:07:17,512 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 14:07:17,524 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 14:07:17,529 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 14:07:17,531 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 14:07:17,584 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=1774137984
2015-11-22 14:07:17,590 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 2
2015-11-22 14:07:17,591 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 14:07:18,670 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-455973355/tmp-1503403762/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 14:07:18,810 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-455973355/tmp1891844311/automaton-1.11-8.jar
2015-11-22 14:07:18,900 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-455973355/tmp1411963783/antlr-runtime-3.4.jar
2015-11-22 14:07:19,034 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-455973355/tmp1193321760/joda-time-2.8.1.jar
2015-11-22 14:07:19,124 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 14:07:19,133 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 14:07:19,133 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 14:07:19,133 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 14:07:19,445 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 14:07:19,869 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:07:19,873 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:07:20,409 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 14:07:20,562 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 14:07:20,562 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 14:07:20,617 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 14:07:20,917 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 40
2015-11-22 14:07:20,922 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 40
2015-11-22 14:07:20,944 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 14
2015-11-22 14:07:21,285 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:15
2015-11-22 14:07:21,784 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0006
2015-11-22 14:07:22,251 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 14:07:22,641 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0006
2015-11-22 14:07:23,389 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0006/
2015-11-22 14:07:23,390 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0006
2015-11-22 14:07:23,390 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd,fd_weather,fd_weather_final,weather
2015-11-22 14:07:23,390 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[33,10],weather[-1,-1],fd_weather[35,13],fd[31,5],fd[-1,-1],fd_weather[35,13] C:  R: fd_weather_final[40,19]
2015-11-22 14:07:23,426 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-22 14:07:23,426 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:08:26,558 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 4% complete
2015-11-22 14:08:26,559 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:08:38,586 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 8% complete
2015-11-22 14:08:38,586 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:08:48,613 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 12% complete
2015-11-22 14:08:48,613 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:09:04,150 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 17% complete
2015-11-22 14:09:04,151 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:09:11,664 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 22% complete
2015-11-22 14:09:11,664 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:09:23,689 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 27% complete
2015-11-22 14:09:23,689 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:09:34,706 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 31% complete
2015-11-22 14:09:34,706 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:09:49,231 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 35% complete
2015-11-22 14:09:49,231 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:10:04,820 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 40% complete
2015-11-22 14:10:04,820 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:10:34,363 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 44% complete
2015-11-22 14:10:34,364 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:11:09,435 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 48% complete
2015-11-22 14:11:09,435 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:11:54,995 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 53% complete
2015-11-22 14:11:54,996 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:12:45,062 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 57% complete
2015-11-22 14:12:45,062 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:13:30,123 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 61% complete
2015-11-22 14:13:30,123 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:14:34,208 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 65% complete
2015-11-22 14:14:34,209 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:14:42,218 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 72% complete
2015-11-22 14:14:42,219 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:14:47,225 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 78% complete
2015-11-22 14:14:47,225 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:14:49,229 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 83% complete
2015-11-22 14:14:49,229 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:15:22,279 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 87% complete
2015-11-22 14:15:22,279 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:15:54,818 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 91% complete
2015-11-22 14:15:54,818 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:18:34,512 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 95% complete
2015-11-22 14:18:34,512 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:19:37,585 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 99% complete
2015-11-22 14:19:37,585 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0006]
2015-11-22 14:22:01,231 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:01,232 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:01,294 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:03,448 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:03,448 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:03,496 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:04,053 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:04,054 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:04,062 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:04,228 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-22 14:22:04,233 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-22 14:07:17	2015-11-22 14:22:04	HASH_JOIN

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448214558608_0006	15	2	367	29	230	232	809	747	778	778	fd,fd_weather,fd_weather_final,weather	HASH_JOIN	/datalake/algo/load_test/flight_info/data/fd_weather_final,

Input(s):
Successfully read 366 records from: "/datalake/algo/load_test/flight_info/data/weather"
Successfully read 55226298 records from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"

Output(s):
Successfully stored 55226298 records (2379374457 bytes) in: "/datalake/algo/load_test/flight_info/data/fd_weather_final"

Counters:
Total records written : 55226298
Total bytes written : 2379374457
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 4
Total records proactively spilled: 54215314

Job DAG:
job_1448214558608_0006


2015-11-22 14:22:04,403 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:04,403 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:04,431 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:04,765 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:04,766 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:04,769 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:04,957 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 14:22:04,958 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 14:22:04,991 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 14:22:05,085 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 145982 time(s).
2015-11-22 14:22:05,086 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-22 14:22:05,287 [main] INFO  org.apache.pig.Main - Pig script completed in 14 minutes, 55 seconds and 974 milliseconds (895974 ms)

