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
	
		/usr/hdp/2.3.0.0-2557/flume/bin/flume-ng agent --conf ./conf/ -f flume2.conf -Dflume.root.logger=DEBUG,console -n TwitterAgent
	

	
--kafka
	
	4. Following step runs an inbuilt kafka consumer (for test purpose only)  <- run at wn4.kara
		/usr/hdp/2.3.0.0-2557/kafka/bin/kafka-console-consumer.sh --zookeeper wn1.kara:2181 --topic twitter-topic

	5. Test success 

--spark stream

	
