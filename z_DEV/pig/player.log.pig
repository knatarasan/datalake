WARNING: Use "yarn jar" to launch YARN applications.
15/10/26 19:58:37 INFO pig.ExecTypeProvider: Trying ExecType : LOCAL
15/10/26 19:58:38 INFO pig.ExecTypeProvider: Picked LOCAL as the ExecType
2015-10-26 19:58:38,152 [main] INFO  org.apache.pig.Main - Apache Pig version 0.15.0.2.3.0.0-2557 (rexported) compiled Jul 14 2015, 10:10:23
2015-10-26 19:58:38,153 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/kannappan/datalake/z_DEV/pig/pig_1445914718150.log
2015-10-26 19:58:38,649 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/kannappan/.pigbootup not found
2015-10-26 19:58:38,884 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: file:///
2015-10-26 19:58:40,286 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: HASH_JOIN,LIMIT
2015-10-26 19:58:40,439 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, ConstantCalculator, GroupByConstParallelSetter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, PartitionFilterOptimizer, PredicatePushdownOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter]}
2015-10-26 19:58:40,664 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2015-10-26 19:58:40,798 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler$LastInputStreamingOptimizer - Rewrite: POPackage->POForEach to POPackage(JoinPackager)
2015-10-26 19:58:40,816 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 2
2015-10-26 19:58:40,816 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 2
2015-10-26 19:58:40,925 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Initializing JVM Metrics with processName=JobTracker, sessionId=
2015-10-26 19:58:40,979 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-10-26 19:58:41,000 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-10-26 19:58:41,007 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-10-26 19:58:41,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2015-10-26 19:58:41,050 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=65904
2015-10-26 19:58:41,051 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-10-26 19:58:41,146 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-10-26 19:58:41,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2015-10-26 19:58:41,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cacche
2015-10-26 19:58:41,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Distributed cache not supported or needed in local mode. Setting key [pig.schematuple.local.dir] with code temp directory: /tmp/1445914721158-0
2015-10-26 19:58:41,298 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-10-26 19:58:41,314 [JobControl] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:41,756 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-10-26 19:58:41,828 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-10-26 19:58:41,829 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-10-26 19:58:41,859 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-10-26 19:58:41,878 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-10-26 19:58:41,879 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-10-26 19:58:41,879 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-10-26 19:58:41,913 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:2
2015-10-26 19:58:42,122 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_local659325934_0001
2015-10-26 19:58:42,216 [JobControl] WARN  org.apache.hadoop.conf.Configuration - file:/tmp/hadoop-kannappan/mapred/staging/kannappan659325934/.staging/job_local659325934_0001/job.xml:an attempt to override final parameter: fs.defaultFS;  Ignoring.
2015-10-26 19:58:42,219 [JobControl] WARN  org.apache.hadoop.conf.Configuration - file:/tmp/hadoop-kannappan/mapred/staging/kannappan659325934/.staging/job_local659325934_0001/job.xml:an attempt to override final parameter: fs.defaultFS;  Ignoring.
2015-10-26 19:58:42,515 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://localhost:8080/
2015-10-26 19:58:42,518 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_local659325934_0001
2015-10-26 19:58:42,519 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases p,p_pa,pa
2015-10-26 19:58:42,519 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: pa[3,5],pa[-1,-1],p_pa[5,8],p[1,4],p[-1,-1],p_pa[5,8] C:  R: p_pa[7,7]
2015-10-26 19:58:42,529 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - OutputCommitter set in config null
2015-10-26 19:58:42,533 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2015-10-26 19:58:42,533 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_local659325934_0001]
2015-10-26 19:58:42,561 [Thread-5] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:42,565 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - OutputCommitter is org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigOutputCommitter
2015-10-26 19:58:42,702 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - Waiting for map tasks
2015-10-26 19:58:42,704 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Starting task: attempt_local659325934_0001_m_000000_0
2015-10-26 19:58:42,798 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:42,857 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task -  Using ResourceCalculatorProcessTree : [ ]
2015-10-26 19:58:42,871 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Processing split: Number of splits :1
Total Length = 34878
Input split[0]:
   Length = 34878
   ClassName: org.apache.hadoop.mapreduce.lib.input.FileSplit
   Locations:

-----------------------

2015-10-26 19:58:42,938 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigRecordReader - Current split being processed file:/home/kannappan/datalake/z_DEV/pig/PlayerAwards.csv:0+34878
2015-10-26 19:58:43,039 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - (EQUATOR) 0 kvi 26214396(104857584)
2015-10-26 19:58:43,041 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - mapreduce.task.io.sort.mb: 100
2015-10-26 19:58:43,041 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - soft limit at 83886080
2015-10-26 19:58:43,042 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufvoid = 104857600
2015-10-26 19:58:43,042 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396; length = 6553600
2015-10-26 19:58:43,059 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Map output collector class = org.apache.hadoop.mapred.MapTask$MapOutputBuffer
2015-10-26 19:58:43,106 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2015-10-26 19:58:43,165 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigGenericMapReduce$Map - Aliases being processed per job phase (AliasName[line,offset]): M: pa[3,5],pa[-1,-1],p_pa[5,8],p[1,4],p[-1,-1],p_pa[5,8] C:  R: p_pa[7,7]
2015-10-26 19:58:43,187 [LocalJobRunner Map Task Executor #0] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigHadoopLogger - org.apache.pig.builtin.Utf8StorageConverter(FIELD_DISCARDED_TYPE_CONVERSION_FAILED): Unable to interpret value [89, 101, 97, 114] in field being converted to int, caught NumberFormatException <For input string: "Year"> field discarded
2015-10-26 19:58:43,333 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - 
2015-10-26 19:58:43,334 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Starting flush of map output
2015-10-26 19:58:43,334 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Spilling map output
2015-10-26 19:58:43,334 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufend = 40182; bufvoid = 104857600
2015-10-26 19:58:43,334 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396(104857584); kvend = 26211760(104847040); length = 2637/6553600
2015-10-26 19:58:43,381 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Finished spill 0
2015-10-26 19:58:43,387 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task:attempt_local659325934_0001_m_000000_0 is done. And is in the process of committing
2015-10-26 19:58:43,414 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - map
2015-10-26 19:58:43,414 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task 'attempt_local659325934_0001_m_000000_0' done.
2015-10-26 19:58:43,414 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Finishing task: attempt_local659325934_0001_m_000000_0
2015-10-26 19:58:43,415 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Starting task: attempt_local659325934_0001_m_000001_0
2015-10-26 19:58:43,425 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:43,426 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task -  Using ResourceCalculatorProcessTree : [ ]
2015-10-26 19:58:43,428 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Processing split: Number of splits :1
Total Length = 31026
Input split[0]:
   Length = 31026
   ClassName: org.apache.hadoop.mapreduce.lib.input.FileSplit
   Locations:

-----------------------

2015-10-26 19:58:43,436 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigRecordReader - Current split being processed file:/home/kannappan/datalake/z_DEV/pig/Players.csv:0+31026
2015-10-26 19:58:43,723 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 25% complete
2015-10-26 19:58:43,724 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Running jobs are [job_local659325934_0001]
2015-10-26 19:58:43,743 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - (EQUATOR) 0 kvi 26214396(104857584)
2015-10-26 19:58:43,744 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - mapreduce.task.io.sort.mb: 100
2015-10-26 19:58:43,744 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - soft limit at 83886080
2015-10-26 19:58:43,744 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufvoid = 104857600
2015-10-26 19:58:43,744 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396; length = 6553600
2015-10-26 19:58:43,746 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Map output collector class = org.apache.hadoop.mapred.MapTask$MapOutputBuffer
2015-10-26 19:58:43,757 [LocalJobRunner Map Task Executor #0] WARN  org.apache.pig.data.SchemaTupleBackend - SchemaTupleBackend has already been initialized
2015-10-26 19:58:43,770 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigGenericMapReduce$Map - Aliases being processed per job phase (AliasName[line,offset]): M: pa[3,5],pa[-1,-1],p_pa[5,8],p[1,4],p[-1,-1],p_pa[5,8] C:  R: p_pa[7,7]
2015-10-26 19:58:43,771 [LocalJobRunner Map Task Executor #0] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigHadoopLogger - org.apache.pig.builtin.Utf8StorageConverter(FIELD_DISCARDED_TYPE_CONVERSION_FAILED): Unable to interpret value [114, 97, 110, 107] in field being converted to int, caught NumberFormatException <For input string: "rank"> field discarded
2015-10-26 19:58:43,771 [LocalJobRunner Map Task Executor #0] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigHadoopLogger - org.apache.pig.builtin.Utf8StorageConverter(FIELD_DISCARDED_TYPE_CONVERSION_FAILED): Unable to interpret value [115, 97, 108] in field being converted to int, caught NumberFormatException <For input string: "sal"> field discarded
2015-10-26 19:58:43,840 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - 
2015-10-26 19:58:43,840 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Starting flush of map output
2015-10-26 19:58:43,840 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Spilling map output
2015-10-26 19:58:43,840 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufend = 36282; bufvoid = 104857600
2015-10-26 19:58:43,840 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396(104857584); kvend = 26211760(104847040); length = 2637/6553600
2015-10-26 19:58:43,845 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Finished spill 0
2015-10-26 19:58:43,847 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task:attempt_local659325934_0001_m_000001_0 is done. And is in the process of committing
2015-10-26 19:58:43,849 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - map
2015-10-26 19:58:43,850 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task 'attempt_local659325934_0001_m_000001_0' done.
2015-10-26 19:58:43,850 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Finishing task: attempt_local659325934_0001_m_000001_0
2015-10-26 19:58:43,850 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - map task executor complete.
2015-10-26 19:58:43,864 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - Waiting for reduce tasks
2015-10-26 19:58:43,865 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - Starting task: attempt_local659325934_0001_r_000000_0
2015-10-26 19:58:43,894 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:43,903 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Task -  Using ResourceCalculatorProcessTree : [ ]
2015-10-26 19:58:43,909 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.ReduceTask - Using ShuffleConsumerPlugin: org.apache.hadoop.mapreduce.task.reduce.Shuffle@22b21700
2015-10-26 19:58:43,943 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - MergerManager: memoryLimit=652528832, maxSingleShuffleLimit=163132208, mergeThreshold=430669056, ioSortFactor=10, memToMemMergeOutputsThreshold=10
2015-10-26 19:58:43,955 [EventFetcher for fetching Map Completion Events] INFO  org.apache.hadoop.mapreduce.task.reduce.EventFetcher - attempt_local659325934_0001_r_000000_0 Thread started: EventFetcher for fetching Map Completion Events
2015-10-26 19:58:44,079 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.LocalFetcher - localfetcher#1 about to shuffle output of map attempt_local659325934_0001_m_000000_0 decomp: 41504 len: 41508 to MEMORY
2015-10-26 19:58:44,092 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.InMemoryMapOutput - Read 41504 bytes from map-output for attempt_local659325934_0001_m_000000_0
2015-10-26 19:58:44,099 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - closeInMemoryFile -> map-output of size: 41504, inMemoryMapOutputs.size() -> 1, commitMemory -> 0, usedMemory ->41504
2015-10-26 19:58:44,106 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.LocalFetcher - localfetcher#1 about to shuffle output of map attempt_local659325934_0001_m_000001_0 decomp: 37604 len: 37608 to MEMORY
2015-10-26 19:58:44,109 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.InMemoryMapOutput - Read 37604 bytes from map-output for attempt_local659325934_0001_m_000001_0
2015-10-26 19:58:44,110 [localfetcher#1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - closeInMemoryFile -> map-output of size: 37604, inMemoryMapOutputs.size() -> 2, commitMemory -> 41504, usedMemory ->79108
2015-10-26 19:58:44,111 [EventFetcher for fetching Map Completion Events] INFO  org.apache.hadoop.mapreduce.task.reduce.EventFetcher - EventFetcher is interrupted.. Returning
2015-10-26 19:58:44,112 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 2 / 2 copied.
2015-10-26 19:58:44,113 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - finalMerge called with 2 in-memory map-outputs and 0 on-disk map-outputs
2015-10-26 19:58:44,145 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Merger - Merging 2 sorted segments
2015-10-26 19:58:44,147 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Merger - Down to the last merge-pass, with 2 segments left of total size: 79086 bytes
2015-10-26 19:58:44,172 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merged 2 segments, 79108 bytes to disk to satisfy reduce memory limit
2015-10-26 19:58:44,173 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merging 1 files, 79110 bytes from disk
2015-10-26 19:58:44,175 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merging 0 segments, 0 bytes from memory into reduce
2015-10-26 19:58:44,175 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Merger - Merging 1 sorted segments
2015-10-26 19:58:44,177 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Merger - Down to the last merge-pass, with 1 segments left of total size: 79095 bytes
2015-10-26 19:58:44,178 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 2 / 2 copied.
2015-10-26 19:58:44,222 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:44,266 [pool-3-thread-1] WARN  org.apache.pig.data.SchemaTupleBackend - SchemaTupleBackend has already been initialized
2015-10-26 19:58:44,295 [pool-3-thread-1] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigMapReduce$Reduce - Aliases being processed per job phase (AliasName[line,offset]): M: pa[3,5],pa[-1,-1],p_pa[5,8],p[1,4],p[-1,-1],p_pa[5,8] C:  R: p_pa[7,7]
2015-10-26 19:58:44,509 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Task - Task:attempt_local659325934_0001_r_000000_0 is done. And is in the process of committing
2015-10-26 19:58:44,529 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 2 / 2 copied.
2015-10-26 19:58:44,529 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Task - Task attempt_local659325934_0001_r_000000_0 is allowed to commit now
2015-10-26 19:58:44,558 [pool-3-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - Saved output of task 'attempt_local659325934_0001_r_000000_0' to file:/tmp/temp309370876/tmp-649268217/_temporary/0/task_local659325934_0001_r_000000
2015-10-26 19:58:44,561 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - reduce > reduce
2015-10-26 19:58:44,563 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.Task - Task 'attempt_local659325934_0001_r_000000_0' done.
2015-10-26 19:58:44,563 [pool-3-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - Finishing task: attempt_local659325934_0001_r_000000_0
2015-10-26 19:58:44,563 [Thread-5] INFO  org.apache.hadoop.mapred.LocalJobRunner - reduce task executor complete.
2015-10-26 19:58:44,725 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2015-10-26 19:58:44,731 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:44,738 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:44,741 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:44,837 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.MRScriptState - Pig script settings are added to the job
2015-10-26 19:58:44,838 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2015-10-26 19:58:44,838 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2015-10-26 19:58:44,838 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2015-10-26 19:58:44,857 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2015-10-26 19:58:44,882 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2015-10-26 19:58:44,888 [JobControl] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:44,920 [JobControl] WARN  org.apache.hadoop.mapreduce.JobResourceUploader - No job jar file set.  User classes may not be found. See Job or Job#setJar(String).
2015-10-26 19:58:44,970 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2015-10-26 19:58:44,970 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2015-10-26 19:58:44,970 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2015-10-26 19:58:44,974 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2015-10-26 19:58:45,030 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_local1351794967_0002
2015-10-26 19:58:45,080 [JobControl] WARN  org.apache.hadoop.conf.Configuration - file:/tmp/hadoop-kannappan/mapred/staging/kannappan1351794967/.staging/job_local1351794967_0002/job.xml:an attempt to override final parameter: fs.defaultFS;  Ignoring.
2015-10-26 19:58:45,081 [JobControl] WARN  org.apache.hadoop.conf.Configuration - file:/tmp/hadoop-kannappan/mapred/staging/kannappan1351794967/.staging/job_local1351794967_0002/job.xml:an attempt to override final parameter: fs.defaultFS;  Ignoring.
2015-10-26 19:58:45,227 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://localhost:8080/
2015-10-26 19:58:45,227 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - OutputCommitter set in config null
2015-10-26 19:58:45,250 [Thread-17] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:45,250 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - OutputCommitter is org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigOutputCommitter
2015-10-26 19:58:45,264 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - Waiting for map tasks
2015-10-26 19:58:45,264 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Starting task: attempt_local1351794967_0002_m_000000_0
2015-10-26 19:58:45,284 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:45,285 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task -  Using ResourceCalculatorProcessTree : [ ]
2015-10-26 19:58:45,288 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Processing split: Number of splits :1
Total Length = 1039
Input split[0]:
   Length = 1039
   ClassName: org.apache.hadoop.mapreduce.lib.input.FileSplit
   Locations:

-----------------------

2015-10-26 19:58:45,304 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigRecordReader - Current split being processed file:/tmp/temp309370876/tmp-649268217/part-r-00000:0+1039
2015-10-26 19:58:45,626 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_local1351794967_0002
2015-10-26 19:58:45,626 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases 
2015-10-26 19:58:45,626 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M:  C:  R: 
2015-10-26 19:58:45,653 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - (EQUATOR) 0 kvi 26214396(104857584)
2015-10-26 19:58:45,654 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - mapreduce.task.io.sort.mb: 100
2015-10-26 19:58:45,654 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - soft limit at 83886080
2015-10-26 19:58:45,654 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufvoid = 104857600
2015-10-26 19:58:45,655 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396; length = 6553600
2015-10-26 19:58:45,662 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Map output collector class = org.apache.hadoop.mapred.MapTask$MapOutputBuffer
2015-10-26 19:58:45,678 [LocalJobRunner Map Task Executor #0] WARN  org.apache.pig.data.SchemaTupleBackend - SchemaTupleBackend has already been initialized
2015-10-26 19:58:45,684 [LocalJobRunner Map Task Executor #0] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigGenericMapReduce$Map - Aliases being processed per job phase (AliasName[line,offset]): M:  C:  R: 
2015-10-26 19:58:45,689 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - 
2015-10-26 19:58:45,689 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Starting flush of map output
2015-10-26 19:58:45,689 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Spilling map output
2015-10-26 19:58:45,689 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - bufstart = 0; bufend = 1059; bufvoid = 104857600
2015-10-26 19:58:45,689 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - kvstart = 26214396(104857584); kvend = 26214360(104857440); length = 37/6553600
2015-10-26 19:58:45,691 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.MapTask - Finished spill 0
2015-10-26 19:58:45,694 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task:attempt_local1351794967_0002_m_000000_0 is done. And is in the process of committing
2015-10-26 19:58:45,696 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - map
2015-10-26 19:58:45,696 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.Task - Task 'attempt_local1351794967_0002_m_000000_0' done.
2015-10-26 19:58:45,697 [LocalJobRunner Map Task Executor #0] INFO  org.apache.hadoop.mapred.LocalJobRunner - Finishing task: attempt_local1351794967_0002_m_000000_0
2015-10-26 19:58:45,697 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - map task executor complete.
2015-10-26 19:58:45,700 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - Waiting for reduce tasks
2015-10-26 19:58:45,703 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - Starting task: attempt_local1351794967_0002_r_000000_0
2015-10-26 19:58:45,724 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:45,733 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Task -  Using ResourceCalculatorProcessTree : [ ]
2015-10-26 19:58:45,734 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.ReduceTask - Using ShuffleConsumerPlugin: org.apache.hadoop.mapreduce.task.reduce.Shuffle@186b7045
2015-10-26 19:58:45,735 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - MergerManager: memoryLimit=652528832, maxSingleShuffleLimit=163132208, mergeThreshold=430669056, ioSortFactor=10, memToMemMergeOutputsThreshold=10
2015-10-26 19:58:45,736 [EventFetcher for fetching Map Completion Events] INFO  org.apache.hadoop.mapreduce.task.reduce.EventFetcher - attempt_local1351794967_0002_r_000000_0 Thread started: EventFetcher for fetching Map Completion Events
2015-10-26 19:58:45,743 [localfetcher#2] INFO  org.apache.hadoop.mapreduce.task.reduce.LocalFetcher - localfetcher#2 about to shuffle output of map attempt_local1351794967_0002_m_000000_0 decomp: 1081 len: 1085 to MEMORY
2015-10-26 19:58:45,744 [localfetcher#2] INFO  org.apache.hadoop.mapreduce.task.reduce.InMemoryMapOutput - Read 1081 bytes from map-output for attempt_local1351794967_0002_m_000000_0
2015-10-26 19:58:45,745 [localfetcher#2] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - closeInMemoryFile -> map-output of size: 1081, inMemoryMapOutputs.size() -> 1, commitMemory -> 0, usedMemory ->1081
2015-10-26 19:58:45,748 [EventFetcher for fetching Map Completion Events] INFO  org.apache.hadoop.mapreduce.task.reduce.EventFetcher - EventFetcher is interrupted.. Returning
2015-10-26 19:58:45,748 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 1 / 1 copied.
2015-10-26 19:58:45,749 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - finalMerge called with 1 in-memory map-outputs and 0 on-disk map-outputs
2015-10-26 19:58:45,750 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Merger - Merging 1 sorted segments
2015-10-26 19:58:45,751 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Merger - Down to the last merge-pass, with 1 segments left of total size: 996 bytes
2015-10-26 19:58:45,753 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merged 1 segments, 1081 bytes to disk to satisfy reduce memory limit
2015-10-26 19:58:45,753 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merging 1 files, 1085 bytes from disk
2015-10-26 19:58:45,753 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.task.reduce.MergeManagerImpl - Merging 0 segments, 0 bytes from memory into reduce
2015-10-26 19:58:45,753 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Merger - Merging 1 sorted segments
2015-10-26 19:58:45,754 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Merger - Down to the last merge-pass, with 1 segments left of total size: 996 bytes
2015-10-26 19:58:45,757 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 1 / 1 copied.
2015-10-26 19:58:45,765 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - File Output Committer Algorithm version is 1
2015-10-26 19:58:45,774 [pool-8-thread-1] WARN  org.apache.pig.data.SchemaTupleBackend - SchemaTupleBackend has already been initialized
2015-10-26 19:58:45,783 [pool-8-thread-1] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.PigMapReduce$Reduce - Aliases being processed per job phase (AliasName[line,offset]): M:  C:  R: 
2015-10-26 19:58:45,787 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Task - Task:attempt_local1351794967_0002_r_000000_0 is done. And is in the process of committing
2015-10-26 19:58:45,797 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - 1 / 1 copied.
2015-10-26 19:58:45,797 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Task - Task attempt_local1351794967_0002_r_000000_0 is allowed to commit now
2015-10-26 19:58:45,805 [pool-8-thread-1] INFO  org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter - Saved output of task 'attempt_local1351794967_0002_r_000000_0' to file:/home/kannappan/datalake/z_DEV/pig/p_pa/_temporary/0/task_local1351794967_0002_r_000000
2015-10-26 19:58:45,807 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - reduce > reduce
2015-10-26 19:58:45,807 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.Task - Task 'attempt_local1351794967_0002_r_000000_0' done.
2015-10-26 19:58:45,807 [pool-8-thread-1] INFO  org.apache.hadoop.mapred.LocalJobRunner - Finishing task: attempt_local1351794967_0002_r_000000_0
2015-10-26 19:58:45,807 [Thread-17] INFO  org.apache.hadoop.mapred.LocalJobRunner - reduce task executor complete.
2015-10-26 19:58:45,931 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,932 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,934 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,961 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2015-10-26 19:58:45,968 [main] INFO  org.apache.pig.tools.pigstats.mapreduce.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.7.1.2.3.0.0-2557	0.15.0.2.3.0.0-2557	kannappan	2015-10-26 19:58:40	2015-10-26 19:58:45	HASH_JOIN,LIMIT

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTime	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_local1351794967_0002	1	1	n/a	n/a	n/a	n/a	n/a	n/a	n/a	n/a			file:///home/kannappan/datalake/z_DEV/pig/p_pa,
job_local659325934_0001	2	1	n/a	n/a	n/a	n/a	n/a	n/a	n/a	n/a	p,p_pa,pa	HASH_JOIN	

Input(s):
Successfully read 660 records from: "file:///home/kannappan/datalake/z_DEV/pig/PlayerAwards.csv"
Successfully read 660 records from: "file:///home/kannappan/datalake/z_DEV/pig/Players.csv"

Output(s):
Successfully stored 10 records in: "file:///home/kannappan/datalake/z_DEV/pig/p_pa"

Counters:
Total records written : 10
Total bytes written : 0
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_local659325934_0001	->	job_local1351794967_0002,
job_local1351794967_0002


2015-10-26 19:58:45,971 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,974 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,977 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:45,997 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:46,000 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:46,003 [main] INFO  org.apache.hadoop.metrics.jvm.JvmMetrics - Cannot initialize JVM Metrics with processName=JobTracker, sessionId= - already initialized
2015-10-26 19:58:46,016 [main] WARN  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Encountered Warning FIELD_DISCARDED_TYPE_CONVERSION_FAILED 3 time(s).
2015-10-26 19:58:46,016 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2015-10-26 19:58:46,078 [main] INFO  org.apache.pig.Main - Pig script completed in 9 seconds and 3 milliseconds (9003 ms)
