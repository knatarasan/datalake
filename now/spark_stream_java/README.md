#This is to set up a standalone Java application to link with SPARK

1. Write java file SimpleApp.java
2. Create pom.xml
	Assign maven repository as https://repo1.maven.org/maven2

3. build with 
	mvn clean && mvn compile && mvn package
4. Execute with 
	
	local	
	~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class SimpleApp ./target/simple-project-1.0.jar test_log.txt --master local[2]
	*works*
	
	$export HADOOP_CONF_DIR=/usr/hdp/2.3.0.0-2557/hadoop-yarn/etc/hadoop

	yarn
	~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class SimpleApp ./target/simple-project-1.0.jar /user/kannappan/test_log.txt --master yarn
	*works*

	yarn
	~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class WordCount ./target/simple-project-1.0.jar /datalake/now/spark_stream_java/tweets.json --master yarn
	*works*
	
~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class WordCount ./target/simple-project-1.0.jar local file:///home/kannappan/datalake/now/spark_stream_java/tweets.json file:///home/kannappan/datalake/now/spark_stream_java/tweets_out --master local



#mvn 
----
To download dependencies
	mvn clean dependency:copy-dependencies && mvn compile && mvn package
Only compile and package
	mvn compile && mvn package


Java packages to process twitt jsons 
https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=java%20how%20to%20parse%20twitter%20json

#Installation of latest spark
	--Above is latest version of spark downloded from http://spark.apache.org/downloads.html
	--release 1.5.1
	--pkg type : pre-built for hadoop 2.6 and later
	--Direct Download
	--click link spark-1.5.1-bin-hadoop2.6.tgz


#spark-submit
	--master 
		local, local[4] <- Local
		spark://host:port <-Standalone cluster
		yarn 	<- YARN cluster
			HADOOP_CONF_DIR='Path of yarn-site.xml location
			

