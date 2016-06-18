#now

This is a data flow work.

twitter --> Flume --> Kafka --> Spark streaming --> Elastic --> Kibana

now
	--flume
	--kafka
	--spark streaming
	--elastic
	--kibana



--flume
	1. Some of the key config details from flume2.conf

		TwitterAgent.sinks.Kafka.zookeeperConnect = wn1.kara:2181
		TwitterAgent.sinks.Kafka.brokerList = wn4.kara:6667
		TwitterAgent.sinks.Kafka.topic = twitter-topic

	2. This folder contains a java file 

	org.flume.source.twitter.json.TwitterSource.java  
		- This is compiled here and jar is placed in folder flume/lib
		- Because default java class brings in twitter feed as avro file, the above one converts to json format

	3. Following step will start flume agent with conf file flum2.conf, <- run this at wn2.kara
	
		/usr/hdp/2.3.0.0-2557/flume/bin/flume-ng agent --conf ./conf/ -f /home/kannappan/datalake/now/twitter_2_flume/flume2.conf -Dflume.root.logger=DEBUG,console -n TwitterAgent
	

	
--kafka
	
	4. Following step runs an inbuilt kafka consumer (for test purpose only)  <- run at wn4.kara
		/usr/hdp/2.3.0.0-2557/kafka/bin/kafka-console-consumer.sh --zookeeper wn1.kara:2181 --topic twitter-topic

	5. Test success 

--spark stream
	6. Run inbuilt example for JavaKafkaWordCount
		~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/run-example org.apache.spark.examples.streaming.JavaKafkaWordCount wn1.kara:2181 now_Consumers twitter-topic 1
	7. Following configuration works fine
		i) spark version 1.4.1
		ii) ~/datalake/archive/spark/spark-1.4.1-bin-hadoop2.6/bin/spark-submit --master local[*] --class JavaKafkaWordCount target/simple-project-1.0-jar-with-dependencies.jar wn1.kara:2181 now_Consumers twitter-topic 1
		iii) pom.xml timestamp 14NOV 7.58 pm
		
	8. Submit above job on yarn

		$export HADOOP_CONF_DIR=/usr/hdp/2.3.0.0-2557/hadoop-yarn/etc/hadoop
		~/datalake/archive/spark/spark-1.4.1-bin-hadoop2.6/bin/spark-submit --master yarn --class JavaKafkaWordCount target/simple-project-1.0-jar-with-dependencies.jar wn1.kara:2181 now_Consumers twitter-topic 1
*fail*
		/usr/hdp/2.3.0.0-2557/spark/bin/spark-submit --master yarn --class JavaKafkaWordCount target/simple-project-1.0-jar-with-dependencies.jar wn1.kara:2181 now_Consumers twitter-topic 1
*works*  Because current version installed  is spark 1.3.1
*works*  Because current version installed  is spark 1.3.1

	9.When tested different sink properties, the flume behaviour is whichever is minimum it takes priority
For eg in the following if rollInterval=1, the it writes a hdfs file for every 1 second
and suppose rollInterval=120 and rollCount is 100, it writes a hdfs file for every 100 row





