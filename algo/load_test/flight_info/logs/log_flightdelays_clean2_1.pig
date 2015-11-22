[kannappan@wn2 flight_info]$ pig flightdelays_clean2.pig
WARNING: Use "yarn jar" to launch YARN applications.
15/11/22 09:51:36 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/11/22 09:51:36 INFO pig.ExecTypeProvider: Trying ExecType : MAPREDUCE
15/11/22 09:51:36 INFO pig.ExecTypeProvider: Picked MAPREDUCE as the ExecType
2015-11-22 09:51:36,740 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-11-22 09:51:36,740 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/algo/load_test/flight_info/pig_1448214696716.log
2015-11-22 09:51:37,754 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-11-22 09:51:37,998 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://wn1.kara:8020
2015-11-22 09:51:41,330 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: GROUP_BY
2015-11-22 09:51:41,472 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 09:51:41,547 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-11-22 09:51:41,853 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-11-22 09:51:41,885 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.CombinerOptimizerUtil - Choosing to move algebraic foreach to combiner
2015-11-22 09:51:41,940 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2015-11-22 09:51:41,941 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2015-11-22 09:51:43,063 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 09:51:43,315 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 09:51:43,904 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-11-22 09:51:43,920 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-11-22 09:51:43,939 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-11-22 09:51:43,942 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-11-22 09:51:44,021 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=3291237264
2015-11-22 09:51:44,022 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 4
2015-11-22 09:51:44,022 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - This job cannot be converted run in-process
2015-11-22 09:51:45,448 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/pig-0.15.0.2.3.0.0-2557-core-h2.jar to DistributedCache through /tmp/temp-1516500969/tmp-1634367477/pig-0.15.0.2.3.0.0-2557-core-h2.jar
2015-11-22 09:51:45,609 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/automaton-1.11-8.jar to DistributedCache through /tmp/temp-1516500969/tmp1644987058/automaton-1.11-8.jar
2015-11-22 09:51:45,692 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/pig/lib/antlr-runtime-3.4.jar to DistributedCache through /tmp/temp-1516500969/tmp1236533832/antlr-runtime-3.4.jar
2015-11-22 09:51:45,834 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Added jar file:/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/joda-time-2.8.1.jar to DistributedCache through /tmp/temp-1516500969/tmp-641568132/joda-time-2.8.1.jar
2015-11-22 09:51:45,918 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-11-22 09:51:45,936 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-11-22 09:51:45,936 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-11-22 09:51:45,937 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2015-11-22 09:51:46,156 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-11-22 09:51:46,528 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 09:51:46,530 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 09:51:47,151 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-11-22 09:51:47,427 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 75
2015-11-22 09:51:47,427 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 75
2015-11-22 09:51:47,555 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 25
2015-11-22 09:51:48,117 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:25
2015-11-22 09:51:48,725 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1448214558608_0001
2015-11-22 09:51:49,029 [JobControl] INFO  org.apache.hadoop.mapred.YARNRunner - Job jar is not present. Not adding any jar to the list of resources.
2015-11-22 09:51:49,649 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1448214558608_0001
2015-11-22 09:51:49,797 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://wn2.kara:8088/proxy/application_1448214558608_0001/
2015-11-22 09:51:49,797 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1448214558608_0001
2015-11-22 09:51:49,797 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases fd,fd_cnt,fd_group
2015-11-22 09:51:49,797 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: fd[3,5],fd[-1,-1],fd_cnt[10,9],fd_group[5,11] C: fd_cnt[10,9],fd_group[5,11] R: fd_cnt[10,9]
2015-11-22 09:51:49,822 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-11-22 09:51:49,823 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:53:46,468 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 9% complete
2015-11-22 09:53:46,468 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:54:14,517 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 13% complete
2015-11-22 09:54:14,518 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:54:54,705 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 18% complete
2015-11-22 09:54:54,705 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:55:39,075 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 23% complete
2015-11-22 09:55:39,075 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:56:11,489 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 28% complete
2015-11-22 09:56:12,365 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:56:33,694 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 32% complete
2015-11-22 09:56:33,694 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:57:14,781 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 39% complete
2015-11-22 09:57:14,782 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:57:23,801 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 43% complete
2015-11-22 09:57:23,801 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:57:28,809 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 48% complete
2015-11-22 09:57:28,809 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:58:03,913 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 52% complete
2015-11-22 09:58:03,913 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:58:18,935 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 56% complete
2015-11-22 09:58:18,935 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 09:59:02,144 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 61% complete
2015-11-22 09:59:02,145 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 10:08:19,193 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 65% complete
2015-11-22 10:08:19,194 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 10:08:29,207 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_1448214558608_0001]
2015-11-22 10:08:44,562 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:44,564 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:44,585 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:47,766 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:47,767 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:47,774 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:48,581 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:48,582 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:48,597 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:48,836 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-11-22 10:08:48,842 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-11-22 09:51:43	2015-11-22 10:08:48	GROUP_BY

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1448214558608_0001	25	4	970	99	253	233	733	673	717	730	fd,fd_cnt,fd_group	GROUP_BY,COMBINER	hdfs://wn1.kara:8020/tmp/temp-1516500969/tmp-1107092949,

Input(s):
Successfully read 102451776 records (3291253464 bytes) from: "/datalake/algo/load_test/flight_info/data/flightdelays_clean"

Output(s):
Successfully stored 64 records (1216 bytes) in: "hdfs://wn1.kara:8020/tmp/temp-1516500969/tmp-1107092949"

Counters:
Total records written : 64
Total bytes written : 1216
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1448214558608_0001


2015-11-22 10:08:48,998 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:48,999 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:49,008 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:49,385 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:49,386 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:49,392 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:49,625 [main] INFO  org.apache.hadoop.yarn.client.api.impl.TimelineClientImpl - Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
2015-11-22 10:08:49,635 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
2015-11-22 10:08:49,643 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2015-11-22 10:08:49,764 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 270816 time(s).
2015-11-22 10:08:49,765 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-11-22 10:08:49,773 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-11-22 10:08:49,797 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 4
2015-11-22 10:08:49,801 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 4
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
2015-11-22 10:08:50,311 [main] INFO  org.apache.pig.Main - Pig script completed in 17 minutes, 15 seconds and 136 milliseconds (1035136 ms)

