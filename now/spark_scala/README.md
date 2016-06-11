
#streaming with scala 

1. cd datalake/now/spark_scala/streaming
2. Create a scala file under 
	Eg : StreamingLogInput.scala

3. ./sbt/sbt assembly   - This is equivalent to maven which will compile the scala file
4. If above step is successful it will create a jar 
	Eg: target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar

5. cd datalake/now/spark_scala/streaming/learning_scala

6. ./fakelogs.sh    (This will act as stream source by open a port at 7777 and start injecting  log file entries )

7. Execute the scala program with following command
$spark-submit --class com.oreilly.learningsparkexamples.scala.StreamingLogInput target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar local[4]

The above will receive log entries and process it with the scala program language

#When you get following error
error: not found: object AssemblyKeys
create following file under streaming/project
$cat assembly.sbt
addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.11.2")


#APP on scala 
This is to run scala as stand alone

1. cd datalake/now/spark_scala/app
2. Create a scala file under 
	Eg : Page.scala

3. ./sbt/sbt assembly   - This is equivalent to maven which will compile the scala file
4. If above step is successful it will create a jar 
	Eg: target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar

$spark-submit --class Page target/scala-2.10/Tutorial-assembly-0.1-SNAPSHOT.jar



# Indexed RDD is explored with following data dump

file:///home/kannappan/datalake/archive/spark/ampcamp6/data/indexedrdd/


---------------------------------------------------------------------
Above programs works fine with spark 1.5 which comes with AMP lab6 download


