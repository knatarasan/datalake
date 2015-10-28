This is output when sqooped 1048576 rows for ingestion

[kannappan@wn2 ingest]$ sqoop import --connect jdbc:mysql://wn1.kara/em_erp --username em_erp --password em_erp --table em_mara --target-dir /apps/dw/ingest/data/em_mara
Warning: /usr/hdp/2.3.0.0-2557/hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /usr/hdp/2.3.0.0-2557/accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
15/10/27 22:47:39 INFO sqoop.Sqoop: Running Sqoop version: 1.4.6.2.3.0.0-2557
15/10/27 22:47:39 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
15/10/27 22:47:39 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
15/10/27 22:47:39 INFO tool.CodeGenTool: Beginning code generation
15/10/27 22:47:40 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `em_mara` AS t LIMIT 1
15/10/27 22:47:40 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `em_mara` AS t LIMIT 1
15/10/27 22:47:40 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /usr/hdp/2.3.0.0-2557/hadoop-mapreduce
Note: /tmp/sqoop-kannappan/compile/2b19553ced95c913410007cb67721b7b/em_mara.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
15/10/27 22:47:46 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-kannappan/compile/2b19553ced95c913410007cb67721b7b/em_mara.jar
15/10/27 22:47:46 WARN manager.MySQLManager: It looks like you are importing from mysql.
15/10/27 22:47:46 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
15/10/27 22:47:46 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
15/10/27 22:47:46 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
15/10/27 22:47:46 INFO mapreduce.ImportJobBase: Beginning import of em_mara
15/10/27 22:47:50 INFO impl.TimelineClientImpl: Timeline service address: http://wn2.kara:8188/ws/v1/timeline/
15/10/27 22:47:50 INFO client.RMProxy: Connecting to ResourceManager at wn2.kara/192.168.1.69:8050
15/10/27 22:48:02 INFO db.DBInputFormat: Using read commited transaction isolation
15/10/27 22:48:02 INFO db.DataDrivenDBInputFormat: BoundingValsQuery: SELECT MIN(`MATNR`), MAX(`MATNR`) FROM `em_mara`
15/10/27 22:48:02 INFO mapreduce.JobSubmitter: number of splits:4
15/10/27 22:48:03 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1446010337719_0001
15/10/27 22:48:04 INFO impl.YarnClientImpl: Submitted application application_1446010337719_0001
15/10/27 22:48:04 INFO mapreduce.Job: The url to track the job: http://wn2.kara:8088/proxy/application_1446010337719_0001/
15/10/27 22:48:04 INFO mapreduce.Job: Running job: job_1446010337719_0001
15/10/27 22:48:28 INFO mapreduce.Job: Job job_1446010337719_0001 running in uber mode : false
15/10/27 22:48:28 INFO mapreduce.Job:  map 0% reduce 0%
15/10/27 22:48:49 INFO mapreduce.Job:  map 25% reduce 0%
15/10/27 22:48:53 INFO mapreduce.Job:  map 50% reduce 0%
15/10/27 22:49:07 INFO mapreduce.Job:  map 75% reduce 0%
15/10/27 22:49:08 INFO mapreduce.Job:  map 100% reduce 0%
15/10/27 22:49:09 INFO mapreduce.Job: Job job_1446010337719_0001 completed successfully
15/10/27 22:49:09 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=566312
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=473
		HDFS: Number of bytes written=204830126
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=8
	Job Counters 
		Launched map tasks=4
		Other local map tasks=4
		Total time spent by all maps in occupied slots (ms)=113573
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=113573
		Total vcore-seconds taken by all map tasks=113573
		Total megabyte-seconds taken by all map tasks=58149376
	Map-Reduce Framework
		Map input records=1048576
		Map output records=1048576
		Input split bytes=473
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=1304
		CPU time spent (ms)=34010
		Physical memory (bytes) snapshot=680095744
		Virtual memory (bytes) snapshot=9412423680
		Total committed heap usage (bytes)=278396928
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=204830126
15/10/27 22:49:09 INFO mapreduce.ImportJobBase: Transferred 195.3412 MB in 80.9328 seconds (2.4136 MB/sec)
15/10/27 22:49:09 INFO mapreduce.ImportJobBase: Retrieved 1048576 records.
