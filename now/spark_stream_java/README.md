#This is to set up a standalone Java application to link with SPARK

1. Write java file SimpleApp.java
2. Create pom.xml
	Assign maven repository as https://repo1.maven.org/maven2

3. build with 
	mvn clean && mvn compile && mvn package
4. Execute with 
	/usr/hdp/2.3.0.0-2557/spark/bin/spark-submit --class SimpleApp ./target/simple-project-1.0.jar ./README.md ./abs
	SPARK_HOME#					class created#	jar file name#			File to read
