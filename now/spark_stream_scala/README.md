#To write streaming with scala 

1. cd datalake/now/spark_stream_scala/scala
2. Create a scala file under 
	Eg : StreamingLogInput.scala

3. ./sbt/sbt assembly   - This is equivalent to maven which will compile the scala file
4. If above step is successful it will create a jar 
	Eg: target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar

5. cd datalake/archive/spark/ampLab2014/streaming/scala/learning_scala

6. ./fakelogs.sh    (This will act as stream source by open a port at 7777 and start injecting  log file entries )

7. Execute the scala program with following command
$spark-submit --class com.oreilly.learningsparkexamples.scala.StreamingLogInput target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar local[4]

The above will receive log entries and process it with the scala program language

