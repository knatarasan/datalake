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
	Some of the key config details from flume2.conf
	-----------------------------------------------
	TwitterAgent.sinks.Kafka.zookeeperConnect = wn1.kara:2181
	TwitterAgent.sinks.Kafka.brokerList = wn4.kara:6667
	TwitterAgent.sinks.Kafka.topic = twitter-topic

	This folder contains a java file 
	--------------------------------
	org.flume.source.twitter.json.TwitterSource.java  
		- This is compiled here and jar is placed in folder flume/lib
		- Because default java class brings in twitter feed as avro file, the above one converts to json format


	

	
