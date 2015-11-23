
[kannappan@wn2 flight_info]$ cat flightdelays_join_merge.pig

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

fd_weather = join fd by (Year,Month,DayofMonth),  weather by (Year,Month,DayofMonth) using 'merge';


fd_weather_final = foreach fd_weather generate fd::Year,fd::Month,fd::DayofMonth,fd::DepTime,fd::UniqueCarrier,fd::FlightNum,fd::ArrDelay,fd::Origin,fd::Dest,weather::PRCP,weather::TMAX,weather::TMIN;

store fd_weather_final into '/datalake/algo/load_test/flight_info/data/fd_weather_final_merge' using PigStorage(',');






[kannappan@wn2 flight_info]$ pig flightdelays_join_merge.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 15:26:46 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 15:26:46 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 15:26:46 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 15:26:46,497 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 15:26:46,498 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448234806494.log
2015-11-22 15:26:47,516 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 15:26:47,830 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 15:26:50,760 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: MERGE_JOIN,ORDER_BY
2015-11-22 15:26:50,888 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 15:26:51,167 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-22 15:26:51,475 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 15:26:51,721 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-95
2015-11-22 15:26:51,722 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.SecondaryKeyOptimizerMR - Using Secondary Key Optimization for MapReduce node scope-122
2015-11-22 15:26:51,743 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 8
2015-11-22 15:26:51,743 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 8
2015-11-22 15:26:53,310 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:26:53,609 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:26:54,258 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:26:54,282 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:26:54,288 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:26:55,567 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp733342609/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:26:55,647 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp-915397464/automaton-1.11-8.jar
2015-11-22 15:26:55,796 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp1425971957/antlr-runtime-3.4.jar
2015-11-22 15:26:55,922 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp388616785/joda-time-2.8.1.jar
2015-11-22 15:26:56,015 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:26:56,037 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:26:56,037 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:26:56,037 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:26:56,100 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:26:56,101 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:26:56,102 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:26:56,654 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp-425912185/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:26:56,730 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp1348657905/automaton-1.11-8.jar
2015-11-22 15:26:56,846 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp1866657109/antlr-runtime-3.4.jar
2015-11-22 15:26:56,954 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp-1438139647/joda-time-2.8.1.jar
2015-11-22 15:26:56,978 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:26:56,979 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:26:56,979 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:26:56,979 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:26:57,008 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 15:26:57,353 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:26:57,355 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:26:57,913 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:26:58,226 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 40
2015-11-22 15:26:58,227 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 40
2015-11-22 15:26:58,307 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 14
2015-11-22 15:26:59,254 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:14
2015-11-22 15:26:59,529 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0009
2015-11-22 15:26:59,859 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:27:00,287 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0009
2015-11-22 15:27:00,864 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0009/
2015-11-22 15:27:00,865 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0009
2015-11-22 15:27:00,865 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 15:27:00,865 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[31,5],fd[-1,-1] C:  R: 
2015-11-22 15:27:01,186 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:27:01,187 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:27:01,287 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:27:01,353 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 15:27:01,353 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 15:27:01,353 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 15:27:01,504 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 15:27:01,637 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0010
2015-11-22 15:27:01,645 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:27:02,324 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0010
2015-11-22 15:27:02,329 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0010/
2015-11-22 15:27:02,329 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0010
2015-11-22 15:27:02,329 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 15:27:02,329 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[35,10],weather[-1,-1] C:  R: 
2015-11-22 15:27:02,373 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-22 15:27:02,373 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0009,job_1448214558608_0010]
2015-11-22 15:27:24,441 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 6% complete
2015-11-22 15:27:24,441 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0009,job_1448214558608_0010]
2015-11-22 15:27:27,449 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 13% complete
2015-11-22 15:27:27,449 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0009]
2015-11-22 15:27:27,668 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:27:27,669 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:27:27,678 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:27:28,484 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:27:28,484 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:27:28,493 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:27:28,964 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:27:28,973 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:27:28,986 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:29:40,068 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 17% complete
2015-11-22 15:29:40,068 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0009]
2015-11-22 15:30:48,624 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 25% complete
2015-11-22 15:30:48,808 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:30:48,810 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:30:48,821 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:30:49,230 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:30:49,230 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:30:49,237 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:30:49,500 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:30:49,501 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:30:49,506 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:30:49,660 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:30:49,662 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:30:49,664 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 15:30:49,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 15:30:49,730 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=6281
2015-11-22 15:30:49,732 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 15:30:49,732 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:30:50,260 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp-1365613118/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:30:50,402 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp-747634977/automaton-1.11-8.jar
2015-11-22 15:30:50,460 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp-38496800/antlr-runtime-3.4.jar
2015-11-22 15:30:50,744 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp2023682775/joda-time-2.8.1.jar
2015-11-22 15:30:50,756 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:30:50,952 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:30:50,952 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:30:50,952 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:30:51,037 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:30:51,038 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:30:51,038 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 15:30:51,038 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 15:30:51,043 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=1925688737
2015-11-22 15:30:51,044 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 15:30:51,044 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:30:51,569 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp-1672423809/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:30:51,661 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp1572291723/automaton-1.11-8.jar
2015-11-22 15:30:51,727 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp275623127/antlr-runtime-3.4.jar
2015-11-22 15:30:51,911 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp683847038/joda-time-2.8.1.jar
2015-11-22 15:30:51,925 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:30:51,926 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:30:51,926 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:30:51,926 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:30:51,948 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 15:30:52,113 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:30:52,113 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:30:52,160 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:30:52,257 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 15:30:52,258 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 15:30:52,258 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 15:30:52,386 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 15:30:52,478 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0011
2015-11-22 15:30:52,485 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:30:52,746 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0011
2015-11-22 15:30:52,750 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0011/
2015-11-22 15:30:52,750 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0011
2015-11-22 15:30:52,750 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 15:30:52,750 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[37,10] C:  R: 
2015-11-22 15:30:52,957 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:30:52,962 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:30:53,093 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:30:53,292 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 14
2015-11-22 15:30:53,295 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 14
2015-11-22 15:30:53,295 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 14
2015-11-22 15:30:53,494 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:14
2015-11-22 15:30:53,602 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0012
2015-11-22 15:30:53,618 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:30:53,876 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0012
2015-11-22 15:30:53,880 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0012/
2015-11-22 15:30:53,880 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0012
2015-11-22 15:30:53,881 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 15:30:53,881 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[33,5] C:  R: 
2015-11-22 15:31:14,854 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 31% complete
2015-11-22 15:31:14,855 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0011,job_1448214558608_0012]
2015-11-22 15:31:23,436 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 37% complete
2015-11-22 15:31:23,436 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0011,job_1448214558608_0012]
2015-11-22 15:31:30,110 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:31:30,111 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:31:30,170 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:31:32,566 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:31:32,567 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:31:32,576 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:31:33,526 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:31:33,548 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:31:33,564 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:32:16,221 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 42% complete
2015-11-22 15:32:16,227 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0012]
2015-11-22 15:35:04,709 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2015-11-22 15:35:04,709 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0012]
2015-11-22 15:35:08,859 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:35:08,860 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:35:08,869 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:35:10,015 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:35:10,016 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:35:10,021 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:35:10,294 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:35:10,294 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:35:10,313 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:35:10,386 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:35:10,387 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:35:10,387 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 15:35:10,387 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 2
2015-11-22 15:35:10,387 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:35:11,127 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp1904239860/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:35:11,244 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp1870206928/automaton-1.11-8.jar
2015-11-22 15:35:11,344 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp-1704491196/antlr-runtime-3.4.jar
2015-11-22 15:35:11,469 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp2064247142/joda-time-2.8.1.jar
2015-11-22 15:35:11,493 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:35:11,526 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:35:11,526 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:35:11,526 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:35:11,683 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:35:11,684 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:35:11,684 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 15:35:11,684 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 15:35:11,684 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:35:12,553 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp1307626493/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:35:12,645 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp308782876/automaton-1.11-8.jar
2015-11-22 15:35:12,786 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp-1087909061/antlr-runtime-3.4.jar
2015-11-22 15:35:13,077 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp-363229005/joda-time-2.8.1.jar
2015-11-22 15:35:13,086 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:35:13,472 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:35:13,472 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:35:13,472 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:35:13,492 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 2 map-reduce job(s) waiting for submission.
2015-11-22 15:35:13,636 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:35:13,636 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:35:13,911 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:35:14,044 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 14
2015-11-22 15:35:14,044 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 14
2015-11-22 15:35:14,045 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 14
2015-11-22 15:35:14,210 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:14
2015-11-22 15:35:14,411 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0013
2015-11-22 15:35:14,418 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:35:16,086 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0013
2015-11-22 15:35:16,093 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0013/
2015-11-22 15:35:16,093 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0013
2015-11-22 15:35:16,093 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd
2015-11-22 15:35:16,093 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[33,5] C:  R: 
2015-11-22 15:35:16,222 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:35:16,223 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:35:16,649 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:35:16,737 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 15:35:16,738 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 15:35:16,738 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-11-22 15:35:17,012 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 15:35:17,094 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0014
2015-11-22 15:35:17,099 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:35:17,941 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0014
2015-11-22 15:35:17,951 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0014/
2015-11-22 15:35:17,951 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0014
2015-11-22 15:35:17,951 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases weather
2015-11-22 15:35:17,952 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: weather[37,10] C:  R: 
2015-11-22 15:35:33,066 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 56% complete
2015-11-22 15:35:33,066 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0013,job_1448214558608_0014]
2015-11-22 15:35:55,518 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 62% complete
2015-11-22 15:35:55,518 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0013,job_1448214558608_0014]
2015-11-22 15:36:00,876 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:36:00,876 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:36:00,890 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:36:01,978 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:36:01,998 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:36:02,022 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:36:02,743 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:36:02,748 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:36:02,783 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:37:11,005 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 66% complete
2015-11-22 15:37:11,005 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0013]
2015-11-22 15:42:10,179 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 70% complete
2015-11-22 15:42:10,179 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0013]
2015-11-22 15:46:42,158 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 74% complete
2015-11-22 15:46:42,158 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0013]
2015-11-22 15:48:30,678 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:48:30,679 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:48:30,726 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:48:31,239 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:48:31,240 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:48:31,248 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:48:31,422 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:48:31,423 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:48:31,425 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:48:31,468 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:48:31,468 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:48:31,469 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 15:48:31,469 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-11-22 15:48:31,469 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:48:31,952 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp-1207122181/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:48:32,119 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp-1655179381/automaton-1.11-8.jar
2015-11-22 15:48:32,177 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp-1335053213/antlr-runtime-3.4.jar
2015-11-22 15:48:32,528 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp1908094328/joda-time-2.8.1.jar
2015-11-22 15:48:32,550 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:48:32,551 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:48:32,551 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:48:32,551 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:48:32,565 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 15:48:32,689 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:48:32,689 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:48:32,969 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:48:33,027 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-11-22 15:48:33,027 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-11-22 15:48:33,286 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-11-22 15:48:33,369 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0015
2015-11-22 15:48:33,375 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:48:33,851 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0015
2015-11-22 15:48:33,855 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0015/
2015-11-22 15:48:33,855 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0015
2015-11-22 15:48:33,855 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases 
2015-11-22 15:48:33,855 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M:  C:  R: 
2015-11-22 15:49:20,125 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 81% complete
2015-11-22 15:49:20,126 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0015]
2015-11-22 15:49:29,139 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 87% complete
2015-11-22 15:49:29,139 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0015]
2015-11-22 15:49:35,268 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:49:35,268 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:49:35,272 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:49:35,761 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:49:35,761 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:49:35,764 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:49:35,997 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:49:35,997 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:49:36,001 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:49:36,059 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 15:49:36,073 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 15:49:36,073 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 15:49:36,615 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp1844468337/tmp-1021907975/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 15:49:36,691 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp1844468337/tmp-974184911/automaton-1.11-8.jar
2015-11-22 15:49:36,757 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp1844468337/tmp-2015386444/antlr-runtime-3.4.jar
2015-11-22 15:49:36,857 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp1844468337/tmp539417892/joda-time-2.8.1.jar
2015-11-22 15:49:36,870 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 15:49:36,875 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 15:49:36,875 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 15:49:36,875 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 15:49:36,914 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 15:49:37,041 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:49:37,041 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:49:37,182 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 15:49:37,249 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 2
2015-11-22 15:49:37,249 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 2
2015-11-22 15:49:37,490 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:16
2015-11-22 15:49:37,590 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0016
2015-11-22 15:49:37,599 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 15:49:38,318 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0016
2015-11-22 15:49:38,321 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0016/
2015-11-22 15:49:38,321 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0016
2015-11-22 15:49:38,321 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd_weather,fd_weather_final
2015-11-22 15:49:38,321 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd_weather[39,13],fd_weather_final[42,19] C:  R: 
2015-11-22 15:55:05,868 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 93% complete
2015-11-22 15:55:05,868 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0016]
2015-11-22 15:55:08,918 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Ooops! Some job has failed! Specify -stop_on_failure if you want Pig to stop immediately on failure.
2015-11-22 15:55:08,919 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - job job_1448214558608_0016 has failed! Stop running all dependent jobs
2015-11-22 15:55:08,919 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-22 15:55:09,777 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:09,778 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:09,784 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=FAILED. Redirecting to job history server
2015-11-22 15:55:10,431 [main] ERROR org.apache.pig.tools.pigstats.PigStats - ERROR 0: org.apache.pig.backend.executionengine.ExecException: ERROR 2997: Unable to recreate exception from backed error: Container [pid=9653,containerID=container_e48_1448214558608_0016_01_000040] is running beyond physical memory limits. Current usage: 522.6 MB of 512 MB physical memory used; 2.2 GB of 1.0 GB virtual memory used. Killing container.
Dump of the process-tree for container_e48_1448214558608_0016_01_000040 :
	|- PID PPID PGRPID SESSID CMD_NAME USER_MODE_TIME(MILLIS) SYSTEM_TIME(MILLIS) VMEM_USAGE(BYTES) RSSMEM_USAGE(PAGES) FULL_CMD_LINE
	|- 9653 9651 9653 9653 (bash) 0 0 115843072 359 /bin/bash -c /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.69 51857 attempt_1448214558608_0016_m_000002_2 52776558133288 1>/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/stdout 2>/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/stderr  
	|- 9667 9653 9653 9653 (java) 5320 82 2237865984 133436 /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.69 51857 attempt_1448214558608_0016_m_000002_2 52776558133288 

Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2015-11-22 15:55:10,432 [main] ERROR org.apache.pig.tools.pigstats.mapreduce.MRPigStatsUtil - 1 map reduce job(s) failed!
2015-11-22 15:55:10,487 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-22 15:26:54	2015-11-22 15:55:10	MERGE_JOIN,ORDER_BY

Some jobs have failed! Stop running all dependent jobs

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448214558608_0009	14	0	215	17	158	178	0	0	0	0	fd	MAP_ONLY	
job_1448214558608_0010	1	0	7	7	7	7	0	0	0	0	weather	MAP_ONLY	
job_1448214558608_0011	1	1	7	7	7	7	6	6	6	6	weather	SAMPLER	
job_1448214558608_0012	14	1	220	19	101	47	201	201	201	201	fd	SAMPLER	
job_1448214558608_0013	14	2	327	37	167	106	702	689	695	695	fd	ORDER_BY	
job_1448214558608_0014	1	1	4	4	4	4	18	18	18	18	weather	ORDER_BY	
job_1448214558608_0015	1	1	6	6	6	6	6	6	6	6		INDEXER	

Failed Jobs:
JobId	Alias	Feature	Message	Outputs
job_1448214558608_0016	fd_weather,fd_weather_final	MERGE_JOIN,MAP_ONLY	Message: Job failed!	/datalake/algo/load_test/flight_info/data/fd_weather_final_merge,

Input(s):
Successfully read 55226298 records (1774139653 bytes) from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"
Successfully read 366 records (7583 bytes) from: "/datalake/algo/load_test/flight_info/data/weather"

Output(s):
Failed to produce result in "/datalake/algo/load_test/flight_info/data/fd_weather_final_merge"

Counters:
Total records written : 0
Total bytes written : 0
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 5
Total records proactively spilled: 52700768

Job DAG:
job_1448214558608_0009	->	job_1448214558608_0012,
job_1448214558608_0012	->	job_1448214558608_0013,
job_1448214558608_0013	->	job_1448214558608_0016,
job_1448214558608_0010	->	job_1448214558608_0011,
job_1448214558608_0011	->	job_1448214558608_0014,
job_1448214558608_0014	->	job_1448214558608_0015,
job_1448214558608_0015	->	job_1448214558608_0016,
job_1448214558608_0016


2015-11-22 15:55:10,607 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:10,608 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:10,612 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:11,261 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:11,261 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:11,265 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:11,394 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:11,395 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:11,397 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:11,563 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:11,564 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:11,567 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:11,775 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:11,775 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:11,781 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:11,907 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:11,907 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:11,910 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:12,059 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:12,059 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:12,062 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:12,863 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:12,863 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:12,867 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:13,015 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:13,015 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:13,018 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:13,234 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:13,235 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:13,241 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:14,552 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:14,552 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:14,555 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:14,751 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:14,752 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:14,754 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:14,900 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:14,900 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:14,903 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:15,075 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:15,076 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:15,080 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:15,213 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:15,213 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:15,216 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:15,363 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:15,363 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:15,366 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:15,778 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:15,778 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:15,782 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:16,017 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:16,017 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:16,021 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:16,216 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:16,217 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:16,220 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:16,422 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:16,422 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:16,425 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:16,564 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 15:55:16,564 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 15:55:16,568 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 15:55:16,642 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 145982 time(s).
2015-11-22 15:55:16,643 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Some jobs have failed! Stop running all dependent jobs
2015-11-22 15:55:16,785 [main] ERROR org.apache.pig.tools.grunt.GruntParser - ERROR 2997: Unable to recreate exception from backed error: Container [pid=9653,containerID=container_e48_1448214558608_0016_01_000040] is running beyond physical memory limits. Current usage: 522.6 MB of 512 MB physical memory used; 2.2 GB of 1.0 GB virtual memory used. Killing container.
Dump of the process-tree for container_e48_1448214558608_0016_01_000040 :
	|- PID PPID PGRPID SESSID CMD_NAME USER_MODE_TIME(MILLIS) SYSTEM_TIME(MILLIS) VMEM_USAGE(BYTES) RSSMEM_USAGE(PAGES) FULL_CMD_LINE
	|- 9653 9651 9653 9653 (bash) 0 0 115843072 359 /bin/bash -c /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.69 51857 attempt_1448214558608_0016_m_000002_2 52776558133288 1>/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/stdout 2>/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/stderr  
	|- 9667 9653 9653 9653 (java) 5320 82 2237865984 133436 /usr/jdk64/jdk1.8.0_40/bin/java -server -XX:NewRatio=8 -Djava.net.preferIPv4Stack=true -Dhdp.version=2.3.0.0-2557 -Xmx409m -Djava.io.tmpdir=/hadoop/yarn/local/usercache/kannappan/appcache/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/hadoop/yarn/log/application_1448214558608_0016/container_e48_1448214558608_0016_01_000040 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 192.168.1.69 51857 attempt_1448214558608_0016_m_000002_2 52776558133288 

Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

Details at logfile: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448234806494.log
2015-11-22 15:55:17,186 [main] INFO  org.apache.pig.Main - Pig script completed in 28 minutes, 30 seconds and 856 milliseconds (1710856 ms)




