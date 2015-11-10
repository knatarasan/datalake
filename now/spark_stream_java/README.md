#This is to set up a standalone Java application to link with SPARK

1. Write java file SimpleApp.java
2. Create pom.xml
	Assign maven repository as https://repo1.maven.org/maven2

3. build with 
	mvn clean && mvn compile && mvn package
4. Execute with 
	~/datalake/archive/spark/spark-1.5.1-bin-hadoop2.6/bin/spark-submit --class SimpleApp ./target/simple-project-1.0.jar

(
	Above is latest version of spark downloded from http://spark.apache.org/downloads.html
	release 1.5.1
	pkg type : pre-built for hadoop 2.6 and later
	Direct Download
	clic link spark-1.5.1-bin-hadoop2.6.tgz


This is working version ..!

