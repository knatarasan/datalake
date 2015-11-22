--fd = load 'part-m-00075' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd = load '/datalake/algo/load_test/flight_info/data/flightdelays_clean' using PigStorage(',') as (Year:int, Month:int, DayofMonth:int, DepTime:int,UniqueCarrier:chararray, FlightNum:int, ArrDelay:int, Origin:chararray , Dest:chararray);

fd_group = group fd by Dest;

--(OAK,{(2008,1,5,1018,WN,3668,22,BUR,OAK),(2008,1,5,837,WN,2613,4,BUR,OAK),(2008,1,5,1806,WN,2182,20,BUR,OAK),(2008,1,5,2017,WN,1587,88,BUR,OAK),(2008,1,5,1750,WN,1398,62,BUR,OAK)})
--(PHX,{(2008,1,5,1837,WN,980,5,BUR,PHX),(2008,1,5,1415,WN,891,57,BUR,PHX),(2008,1,5,1654,WN,481,29,BUR,PHX),(2008,1,5,2131,WN,444,54,BUR,PHX),(2008,1,5,1038,WN,320,8,BUR,PHX)})

fd_cnt = foreach fd_group generate group, AVG(fd.ArrDelay);

dump fd_cnt;


[kannappan@wn2 flight_info]$ pig flightdelays_clean2.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/21 10:46:32 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/21 10:46:32 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/21 10:46:32 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-21 10:46:32,230 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-21 10:46:32,230 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448131592226.log
2015-11-21 10:46:34,558 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-21 10:46:34,850 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-21 10:46:38,165 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: GROUP_BY
2015-11-21 10:46:38,251 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-21 10:46:38,329 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-21 10:46:38,706 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-21 10:46:38,742 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.CombinerOptimizerUtil - Choosing to move algebraic foreach to combiner
2015-11-21 10:46:38,821 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2015-11-21 10:46:38,822 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2015-11-21 10:46:41,142 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:46:41,571 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:46:42,404 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-21 10:46:42,429 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-21 10:46:42,442 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-21 10:46:42,446 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-21 10:46:42,620 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=3291237264
2015-11-21 10:46:42,621 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 4
2015-11-21 10:46:42,621 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-21 10:46:44,114 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-110490357/tmp-1984785559/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-21 10:46:44,236 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-110490357/tmp-781427504/automaton-1.11-8.jar
2015-11-21 10:46:44,425 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-110490357/tmp-119158782/antlr-runtime-3.4.jar
2015-11-21 10:46:44,559 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-110490357/tmp676079127/joda-time-2.8.1.jar
2015-11-21 10:46:44,645 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-21 10:46:44,657 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-21 10:46:44,657 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-21 10:46:44,657 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-21 10:46:44,886 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-21 10:46:45,247 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:46:45,248 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:46:45,883 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-21 10:46:46,244 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 75
2015-11-21 10:46:46,244 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 75
2015-11-21 10:46:46,382 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 25
2015-11-21 10:46:46,761 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:25
2015-11-21 10:46:48,767 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448117976025_0007
2015-11-21 10:46:49,253 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-21 10:46:49,637 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448117976025_0007
2015-11-21 10:46:49,780 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448117976025_0007/
2015-11-21 10:46:49,782 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448117976025_0007
2015-11-21 10:46:49,782 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd,fd_cnt,fd_group
2015-11-21 10:46:49,782 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[3,5],fd[-1,-1],fd_cnt[10,9],fd_group[5,11] C: fd_cnt[10,9],fd_group[5,11] R: fd_cnt[10,9]
2015-11-21 10:46:49,835 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-21 10:46:49,835 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:49:25,976 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 14% complete
2015-11-21 10:49:25,976 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:49:48,443 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 18% complete
2015-11-21 10:49:48,444 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:49:57,027 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 25% complete
2015-11-21 10:49:57,028 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:54:42,303 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 32% complete
2015-11-21 10:54:42,304 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:55:06,422 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 38% complete
2015-11-21 10:55:06,423 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:55:16,705 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 44% complete
2015-11-21 10:55:16,705 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:56:00,497 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 48% complete
2015-11-21 10:56:00,498 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:56:25,552 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 53% complete
2015-11-21 10:56:25,553 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:56:47,613 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 57% complete
2015-11-21 10:56:47,613 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:58:35,786 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 61% complete
2015-11-21 10:58:35,786 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:59:27,873 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 91% complete
2015-11-21 10:59:27,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:59:28,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 95% complete
2015-11-21 10:59:28,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:59:30,878 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448117976025_0007]
2015-11-21 10:59:34,858 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:34,861 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:34,913 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:36,405 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:36,405 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:36,411 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:37,137 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:37,138 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:37,143 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:37,288 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-21 10:59:37,293 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-21 10:46:42	2015-11-21 10:59:37	GROUP_BY

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448117976025_0007	25	4	742	257	449	477	411	265	310	283	fd,fd_cnt,fd_group	GROUP_BY,COMBINER	hdfs://wn1.kara:8020/tmp/temp-110490357/tmp-1940487911,

Input(s):
Successfully read 102451776 records (3291253464 bytes) from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"

Output(s):
Successfully stored 64 records (1216 bytes) in: "hdfs://wn1.kara:8020/tmp/temp-110490357/tmp-1940487911"

Counters:
Total records written : 64
Total bytes written : 1216
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1448117976025_0007


2015-11-21 10:59:37,491 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:37,492 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:37,498 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:37,862 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:37,862 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:37,878 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:38,288 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-21 10:59:38,288 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-21 10:59:38,296 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-21 10:59:38,434 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 270816 time(s).
2015-11-21 10:59:38,434 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-21 10:59:38,467 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-21 10:59:38,502 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 4
2015-11-21 10:59:38,506 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 4
(AMA,13.606060606060606)
(BNA,8.63921568627451)
(CRP,15.142857142857142)
(DEN,18.209580838323355)
(ELP,16.989473684210527)
(GEG,39.244897959183675)
(JAX,6.2727272727272725)
(MCO,1.4164305949008498)
(MHT,9.232558139534884)
(OAK,32.28125)
(ONT,25.379746835443036)
(SDF,9.068965517241379)
(TPA,1.8571428571428572)
(BDL,17.75925925925926)
(CMH,7.734939759036145)
(FLL,4.044444444444444)
(HOU,9.071428571428571)
(HRL,3.838709677419355)
(ISP,14.476190476190476)
(LAS,23.849927849927848)
(MAF,10.088235294117647)
(PVD,12.635416666666666)
(RSW,4.147058823529412)
(SAT,4.863636363636363)
(SLC,27.79020979020979)
(SNA,16.35185185185185)
(TUS,30.615384615384617)
(ALB,15.341463414634147)
(AUS,6.307142857142857)
(BHM,2.182926829268293)
(BUF,12.73469387755102)
(BUR,31.380116959064328)
(DAL,7.988795518207283)
(DTW,10.535714285714286)
(IND,25.98)
(JAN,13.846153846153847)
(LAX,35.83679525222552)
(LIT,14.974358974358974)
(MCI,10.822966507177034)
(MSY,3.883495145631068)
(OKC,4.548387096774194)
(OMA,27.695652173913043)
(ORF,12.025641025641026)
(PBI,-2.292682926829268)
(PIT,9.424242424242424)
(RDU,8.966666666666667)
(RNO,27.3)
(SEA,15.518796992481203)
(STL,6.635922330097087)
(TUL,12.24074074074074)
(ABQ,17.96923076923077)
(BOI,21.5)
(BWI,8.002008032128513)
(CLE,12.784313725490197)
(IAD,17.84375)
(LBB,6.111111111111111)
(MDW,10.32262996941896)
(PDX,28.23931623931624)
(PHL,5.959770114942529)
(PHX,19.256013745704468)
(SAN,31.170068027210885)
(SFO,91.27631578947368)
(SJC,32.68348623853211)
(SMF,31.09090909090909)
2015-11-21 10:59:39,566 [main] INFO  org.apache.pig.Main - Pig script completed in 13 minutes, 7 seconds and 863 milliseconds (787863 ms)




[kannappan@wn2 flight_info]$ hadoop fs -ls /datalake/algo/load_test/flight_info/data/flightdelays_clean
Found 76 items
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
-rw-r--r--   3 kannappan hdfs   44353355 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00040
-rw-r--r--   3 kannappan hdfs   44352613 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00041
-rw-r--r--   3 kannappan hdfs   44353949 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00042
-rw-r--r--   3 kannappan hdfs   44352472 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00043
-rw-r--r--   3 kannappan hdfs   44353732 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00044
-rw-r--r--   3 kannappan hdfs   44353833 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00045
-rw-r--r--   3 kannappan hdfs   44352502 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00046
-rw-r--r--   3 kannappan hdfs   44353797 2015-11-21 08:57 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00047
-rw-r--r--   3 kannappan hdfs   44353387 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00048
-rw-r--r--   3 kannappan hdfs   44352728 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00049
-rw-r--r--   3 kannappan hdfs   44353777 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00050
-rw-r--r--   3 kannappan hdfs   44353020 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00051
-rw-r--r--   3 kannappan hdfs   44353030 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00052
-rw-r--r--   3 kannappan hdfs   44353867 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00053
-rw-r--r--   3 kannappan hdfs   44352504 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00054
-rw-r--r--   3 kannappan hdfs   44353654 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00055
-rw-r--r--   3 kannappan hdfs   44353824 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00056
-rw-r--r--   3 kannappan hdfs   44352476 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00057
-rw-r--r--   3 kannappan hdfs   44353821 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00058
-rw-r--r--   3 kannappan hdfs   44353301 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00059
-rw-r--r--   3 kannappan hdfs   44352540 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00060
-rw-r--r--   3 kannappan hdfs   44353971 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00061
-rw-r--r--   3 kannappan hdfs   44352582 2015-11-21 08:58 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00062
-rw-r--r--   3 kannappan hdfs   44353611 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00063
-rw-r--r--   3 kannappan hdfs   44353903 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00064
-rw-r--r--   3 kannappan hdfs   44352425 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00065
-rw-r--r--   3 kannappan hdfs   44353877 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00066
-rw-r--r--   3 kannappan hdfs   44353388 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00067
-rw-r--r--   3 kannappan hdfs   44352670 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00068
-rw-r--r--   3 kannappan hdfs   44353820 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00069
-rw-r--r--   3 kannappan hdfs   44353212 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00070
-rw-r--r--   3 kannappan hdfs   44352777 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00071
-rw-r--r--   3 kannappan hdfs   44353904 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00072
-rw-r--r--   3 kannappan hdfs   44352499 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00073
-rw-r--r--   3 kannappan hdfs    9095634 2015-11-21 08:59 /datalake/algo/load_test/flight_info/data/flightdelays_clean/part-m-00074
