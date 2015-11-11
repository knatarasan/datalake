## Twitter Flume source

Compiled from various samples using twitter classes to use as source and filter data based on keywords


Tested with HDP 2.3

Installation and use:

1) Install Flume on a node(s) (yum install mapr-flume)
(Note: This package already contains a twitter source for the 1% feed and provides the sink in avro format, not json, and also doesn’t have any keyword filter options)

2) Verify the versions of the twitter core and stream jars in the <FLUME_HOME>/lib directory. These need to be 3.0.6 or later (twitter4j-core-3.0.6.jar & twitter4j-stream-3.0.6.jar)

If they are older versions copy from apache or use the jars available in this github by going to the <FLUME_HOME>/lib directory and executing the commands below

3) run 
	$mvn install
 	copy the file created into <FLUME_HOME>/lib
